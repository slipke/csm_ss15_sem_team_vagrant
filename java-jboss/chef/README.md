# csm_ss15_sem_team_vagrant
CSM SS15 System Engineering &amp; Management: Team Vagrant

This project installs a jboss instance based on the module of [andy-dufour](https://supermarket.chef.io/cookbooks/jboss7).
If you do no other modifications and use vagrant you will find your Jboss-server under 192.168.33.10:8080.
If you use any other infrastructure you will find your Jboss-server under the servers ip:8080.
This project installs a standard management user which can be used for the web-management-portal of the jboss server:
Username: Administrator
password: changeit!

The credentials can be modified before the installation in the 
[default.rb file](/attributes/default.rb) file.
Keep in  mind, that the password must be insert in the following format:
HEX( MD5( username ':' realm ':' password))

The credentials can be modified after the installation with the user.sh script. For this use case follow the official [documentation](https://docs.jboss.org/author/display/AS71/add-user+utility) on:

Dependencies
* [apt-get](https://supermarket.chef.io/cookbooks/apt)
* [java](https://supermarket.chef.io/cookbooks/java)
* [jboss](https://supermarket.chef.io/cookbooks/jboss7)


installation
	- check out the project
	- open a terminal / console in this folder
	- vagrant up

Configuration
