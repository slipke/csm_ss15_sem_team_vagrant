# csm_ss15_sem_team_vagrant
CSM SS15 System Engineering &amp; Management: Team Vagrant

@@@ WIP @@@

##Why this project?
It is intended for people who cant use a chef server or dont want or its not worth to set one up. easy and works out of the box after installing chef-client/chef-server
Simple modules made it easy to setup a basic box. reusable modules for students and small not long lasting projects. just a minimal setup
##How to use this project?
`git clone ...`

##Install vagrant (Link to vagrant.md)
* [Github tutorial](https://github.com/mitchellh/vagrant)
* [offical vagrant documentation](https://docs.vagrantup.com/v2/)
    
##Setup chef (Link to chef.md)
##Setup puppet (Link to puppet.md)

##Used software

* Java (JBoss) (https://docs.jboss.org/author/display/AS71/Documentation)
* Java (Tomcat) (http://tomcat.apache.org/tomcat-6.0-doc/)
* LAMP (Link to lamp-apache)
* LNMP (nginx instead of apache) (Link to lamp-nginx)

##How to use hardening

* Chef
* Puppet

##How to use librarian-puppet on windows

For the usage of librarian-puppet you have to install Ruby on your Windows machine.
http://rubyinstaller.org/downloads/
The librarian-puppet package needs also a puppet installation on the machine. This is also required, when you just want to download the puppet modules and install them on a guest system like a vagrant machine. It is possible that you will get SSL Authentication Errors when you start "librarian-puppet install". This is caused by non existent certificates. One fast workaround is to start your computer management and add a new envirment variable called "SSL_CERT_FILE" with the value of CHEFDK-HOME\embedded\ssl\certs\cacert.pem or download the file http://curl.haxx.se/ca/cacert.pem and point your path variable to this file.

##Introduction of used software
###vagrant
Vagrant is a tool, which allows the setup of virtual maschines defined by code. Vagrant will be installed on the used OS and need a virtualisation software like [virtualbox](https://www.virtualbox.org/), [Windows Hyper-V](http://windows.microsoft.com/de-de/windows-8/hyper-v-run-virtual-machines), [Docker](https://www.docker.com/) or [VMWare](http://www.vmware.com/de). The plain instalation of vagrant contains the support for virtualbox, the other virtualisation software can be supported with [provider-plugin's](https://docs.vagrantup.com/v2/providers/index.html). The entry point for vagrant is the [Vagrantfile](https://docs.vagrantup.com/v2/vagrantfile/index.html). In this file, there will be done all definitions for the guest maschine. The syntax for this file is ruby. For example there is a small definition file which defines the kind, a ip adress and how the maschines network interface is mapped to the host and a host name for the maschine.
```ruby
Vagrant.configure(2) do |config|
	 config.vm.box = "hashicorp/precise32“
	 config.vm.network "private_network", ip: "192.168.33.46"
   config.vm.hostname = "puppet-jboss“
end
```
The secound line defines the kind of the maschine. This can be a Linux or a Windows image. If you don't give a destiniation where vagrant should search for the maschine, it looks up at [atlas](https://atlas.hashicorp.com/boxes/search). On this site, there are many more boxes which can be used for free. When you now [start](#usefull-Commands) the virtualmaschine, it will only start the plain os image specified by the ```config.vm.box``` parameter. For the most use cases, we need now a possibility to change or add software to the plain os. This possibility is called provision and can be done in many ways. 
####provision possibilities
Vagrant enabled many ways to provision the guest maschine. There are possibilities for basic provision with [shell](https://docs.vagrantup.com/v2/provisioning/shell.html) or [File](https://docs.vagrantup.com/v2/provisioning/file.html) commands, but there are many more powerfull ways. So you can use [ansible](https://docs.vagrantup.com/v2/provisioning/ansible.html), [salt](https://docs.vagrantup.com/v2/provisioning/salt.html), [chef](https://docs.vagrantup.com/v2/provisioning/chef_solo.html) or [puppet](https://docs.vagrantup.com/v2/provisioning/puppet_apply.html). For this project we only use **chef** and **puppet**. 
#####vagrant configuration for chef
This section describes only the assumptions and configuration points of vagrant for provisioning with chef. The tried the approach for using [roles]() from chef. This leads to the following vagrant configuration.
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
 
 
#####vagrant configuration for puppet
This section describes only the assumptions and configuration points of vagrant for provisioning with puppet. The following configuration describes a provisioning with given modules which will be altered with a own written module after their complition.
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

####usefull-vagrant-commands
* ```vagrant init``` creates a new vagrantfile (usefull when you want to create your own maschine)
* ```vagrant up``` starts the virtual maschine with the configuration done in the Vagrantfile, also the provisioning
* ```vagrant provison``` runs the provision commands, defined in the vagrant file on a already running maschine.
* ```vagrant provision --provision-with shell``` runs only the shell provision commands, this can also be done with all other provision possibilities.
* ```vagrant ssh``` login on the guest maschine with ssh, if this doesn't work, you start a shell and type ```ssh -p 2222 vagrant@localhost``` with the userpasswort ```vagrant```. If you use windows and have git installed, just right click and open ```Git Bash```. Now you can use the ssh command. When you run more than one guest maschine on your system, check which port you have to use, for login on your target maschine. You can find the port in the output  ```default: SSH address: 127.0.0.1:[HereYourPort]```
* ```vagrant rdp``` windows counterpart to ssh, when you have windows maschine as guest system
* ```vagrant suspend``` standby the guest system
* ```vagrant halt``` shutdown the guest system
* ```vagrant destroy``` shutdown the guest system and delete all data which is produced during the startup




###chef
###puppet



