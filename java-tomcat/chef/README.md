# csm_ss15_sem_team_vagrant
CSM SS15 System Engineering &amp; Management: Team Vagrant

This project installs a tomcat instance based on the cookbook of [opscode-cookbooks](https://github.com/opscode-cookbooks/tomcat) with a minor change by me.
If you do no other modifications and use vagrant you will find your tomcat server under 192.168.33.11:8080.
If you use any other infrastructure you will find your tomcats-server under the servers ip:8080.
This project installs a standard management user which can be used for the web-management-portal of the tomcat server:
Username: admin
password: password
A normal user will also be created. The credentials are:
Username: user
password: password

The credentials can be modified before the installation in the 
[admin.json file](/data_bags/tomcat_users/admin.json) file.


The credentials can be modified after the installation in  the tomcat-users.xml. For this use case follow the official [documentation](http://tomcat.apache.org/tomcat-6.0-doc/manager-howto.html).

##Dependencies

###installed software
If you use the vagrant solution you only have to install [vagrant](https://www.vagrantup.com/) and [virtualbox](https://www.virtualbox.org/). Additional you will need the [vagrant-berkshelf plugin](https://github.com/berkshelf/vagrant-berkshelf). For installation tutorials read the github readme of vagrant-berkshelf plugin.
If you use this cookbook as standalone projekt you have to install chef.
####manuel
If you use this project as standalone project, kepp in mind that is only tested and verified with the linux hashicorp/precise32 vagrant box. If you have a vm where you want to setup this project, you should have chef installed.
A possible chef installation is [chefdk](https://downloads.chef.io/chef-dk/).  Berkshelf is need for the Dependency Management ( this is already included in the chefdk). When you have installed the chefdk (or chef + berkshelf),you should switch to the git repo. Now you can resolve the dependencies by typing "berks install".
After that you can start the chef installation.

###cookbooks
* [apt](https://supermarket.chef.io/cookbooks/apt)
* [java](https://supermarket.chef.io/cookbooks/java)
* [tomcat](https://github.com/kkoStudyAcc/tomcat)


##Installation
Check first if you have installed vagrant and virtualbox.  After that check out the project in an user writeable folder.
Open a terminal / commandline in this folder and just type: vagrant up

##Configuration
This project configure a management user for the management tomcat web interface. The Username is "admin" and the password is "password" both without the quote. If you want to change these credentials you have to edit the [admin.json file](/data_bags/tomcat_users/admin.json) file. 
The normal user configuration can be found and changed with the file [user.json](/data_bags/tomcat_users/user.json)

