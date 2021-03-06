#Vagrant -  in terms of this project


##Vagrant installation
Vagrant is available for Windows, Linux and Mac. You can download your package [here](https://www.vagrantup.com/downloads.html). Our projects are tested with Virtualbox, so we recommend to use Virtualbox as virtualisation software. However the projects should work also with the other supported software mentioned by Vagrant. 
###Plugin's dependent on which provisioning kind you want to use
####Vhef
If you use a Chef project you have to install the [Vagrant-Berkshelf-Plugin](https://github.com/berkshelf/vagrant-berkshelf).

####Puppet
If you use a Puppet project you have to install the [Librarian-Puppet](https://github.com/rodjek/librarian-puppet). This requieres additional the installation of [Puppet](https://docs.puppetlabs.com/guides/install_puppet/pre_install.html#next-install-puppet) and Ruby.



##Vagrant introduction and configuration
Vagrant is a tool, which allows the setup of virtual maschines defined by code. Vagrant will be installed on the used OS and need a virtualisation software like [Virtualbox](https://www.virtualbox.org/), [Windows Hyper-V](http://windows.microsoft.com/de-de/windows-8/hyper-v-run-virtual-machines), [Docker](https://www.docker.com/) or [VMWare](http://www.vmware.com/de). The plain instalation of Vagrant contains the support for Virtualbox, the other virtualisation software can be supported with [provider-plugin's](https://docs.vagrantup.com/v2/providers/index.html). The entry point for Vagrant is the [Vagrantfile](https://docs.vagrantup.com/v2/vagrantfile/index.html). In this file, there will be done all definitions for the guest maschine. The syntax for this file is Ruby. For example there is a small definition file which defines the kind, a ip adress and how the maschines network interface is mapped to the host and a host name for the maschine.
```ruby
Vagrant.configure(2) do |config|
	 config.vm.box = "hashicorp/precise32“
	 config.vm.network "private_network", ip: "192.168.33.46"
   config.vm.hostname = "puppet-jboss“
end
```
The secound line defines the kind of the maschine. This can be a Linux or a Windows image. If you don't give a destiniation where Vagrant should search for the maschine, it looks up at [atlas](https://atlas.hashicorp.com/boxes/search). On this site, there are many more boxes which can be used for free. When you now [start](#usefull-Commands) the virtualmaschine, it will only start the plain OS image specified by the ```config.vm.box``` parameter. For the most use cases, we need now a possibility to change or add software to the plain OS. This possibility is called provision and can be done in many ways. 
###Provision possibilities
Vagrant enabled many ways to provision the guest maschine. There are possibilities for basic provision with [Shell](https://docs.vagrantup.com/v2/provisioning/shell.html) or [File](https://docs.vagrantup.com/v2/provisioning/file.html) commands, but there are many more powerfull ways. So you can use [Ansible](https://docs.vagrantup.com/v2/provisioning/ansible.html), [Salt](https://docs.vagrantup.com/v2/provisioning/salt.html), [Chef](https://docs.vagrantup.com/v2/provisioning/chef_solo.html) or [Puppet](https://docs.vagrantup.com/v2/provisioning/puppet_apply.html). For this project we only use **Chef** and **Puppet**. 
##Vagrant configuration for Chef
This section describes only the assumptions and configuration points of Vagrant for provisioning with Chef. The tried the approach for using [roles](http://docs.chef.io/roles.html) from Chef. This leads to the following vagrant configuration.
```ruby
config.vm.provision "chef_solo" do |chef|
    chef.roles_path = "roles"
    chef.add_role("jboss")
 end
``` 
This implies the following folder structure.

```
|--   vagrantfile
|--   attributes
|--   roles
|--   |-- jboss.rb
|--   recipes
|--   templates
```
 
 
##Vagrant configuration for Puppet
This section describes only the assumptions and configuration points of Vagrant for provisioning with Puppet. The following configuration describes a provisioning with given modules which will be altered with a own written module after their completion.
```ruby
config.vm.provision :puppet do |puppet|
    puppet.module_path = ["modules","puppet/modules" ]
    puppet.options = ['--verbose']
    puppet.manifests_path = "puppet/manifests"
    puppet.manifest_file = "site.pp„
end
``` 
This implies the following folder structure.
```
|--   vagrantfile
|--   puppet
|--   |--  manifests
|--   |--  modules
|--   |--  |-- jboss-config
```

##Usefull-Vagrant-Commands
These commands can be used in your shell or command line interface. Just open such a shell in your folder, where you vagrantfile is located and type in the following commands:

* ```vagrant init``` creates a new vagrantfile (usefull when you want to create your own maschine)
* ```vagrant up``` starts the virtual maschine with the configuration done in the Vagrantfile, also the provisioning is done. The Vagrantfile will be searched in the current folder, as well as all parent folders. A short example should explain this. This is the current path where the shell is started:  ```/home/max/documents/testproject ``` and on all these paths will be searched ( the order of the lookup is as shown)
```
/home/max/documents/testproject/vagrantfile
/home/max/documents/vagrantfile
/home/max/vagrantfile
/home/vagrantfile
/vagrantfile
```
* ```vagrant provison``` runs the provision commands, defined in the vagrantfile on a already running maschine.
* ```vagrant provision --provision-with shell``` runs only the shell provision commands, this can also be done with all other provision possibilities.
* ```vagrant ssh``` login on the guest maschine with ssh, if this doesn't work, you start a shell and type ```ssh -p 2222 vagrant@localhost``` with the userpasswort ```vagrant```. If you use windows and have git installed, just right click and open ```Git Bash```. Now you can use the ssh command. When you run more than one guest maschine on your system, check which port you have to use, for login on your target maschine. You can find the port in the output  ```default: SSH address: 127.0.0.1:[HereYourPort]```
* ```vagrant rdp``` windows counterpart to ssh, when you have windows maschine as guest system
* ```vagrant suspend``` standby the guest system
* ```vagrant halt``` shutdown the guest system
* ```vagrant destroy``` shutdown the guest system and delete all data which is produced during the startup


##Source
For more Information refer to the offical documentation of [Vagrant](https://docs.vagrantup.com/v2/). 
Other external sources may help troubleshooting problems and give more information about the technology behind Vagrant, here are some examples.
* [external tutorial](https://github.com/mitchellh/vagrant)
* [offical Vagrant documentation](https://docs.vagrantup.com/v2/)
