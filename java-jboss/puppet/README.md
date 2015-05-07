# csm_ss15_sem_team_vagrant
CSM SS15 System Engineering &amp; Management: Team Vagrant

This project installs a jboss instance based on the module of [example42/jboss](https://forge.puppetlabs.com/example42/jboss).
If you do no other modifications and use vagrant you will find your Jboss-server under 192.168.33.10:8080.
If you use any other infrastructure you will find your Jboss-server under the servers ip:8080.
The management interface is bind to port 9900.
This project installs a standard management user which can be used for the web-management-portal of the jboss server:
Username: Administrator
password: changeit!

The credentials can be modified before the installation in the 
[init.pp file](puppet/modules/jboss-config/manifests/init.pp) file.
Keep in  mind, that the password must be insert in the following format:
HEX( MD5( username ':' realm ':' password))

The credentials can be modified after the installation with the user.sh script. For this use case follow the official [documentation](https://docs.jboss.org/author/display/AS71/add-user+utility) on:

##Dependencies

###installed software
If you use the vagrant solution you only have to install [vagrant](https://www.vagrantup.com/) and [virtualbox](https://www.virtualbox.org/). Additional you need to install librarian-puppet. Librarian-puppet will resolve all dependencies and download the additional required modules.  A tutorial for this  can be found [here](../../README.MD). 
If you use this project as standalone projekt you have to install puppet.

###puppet modules
* [puppetlabs-java](https://forge.puppetlabs.com/puppetlabs/java)
* [jboss](https://forge.puppetlabs.com/example42/jboss)


##Installation
Check first if you have installed vagrant and virtualbox.  After that check out the project in an user writeable folder.
Open a terminal / commandline in this folder and type: librarian-puppet install. This will resolve all dependencies. After that just type: vagrant up.

##Configuration
This project configure a management user for the management jboss web interface. The Username is "Administrator" and the password is "changeit!" both without the quote. If you want to change these credentials you have to edit the [init.pp file](puppet/modules/jboss-config/manifests/init.pp) file. There are two variables which are need to do this:
* $admin_user
*$admin_pass
Keep in  mind, that the password must be insert in the following format:
HEX( MD5( username ':' realm ':' password))

