# csm_ss15_sem_team_vagrant
CSM SS15 System Engineering &amp; Management: Team Vagrant

@@@ WIP @@@

##Why this project?
It is intended for people who cant use a chef server or dont want or its not worth to set one up. easy and works out of the box after installing chef-client/chef-server
Simple modules made it easy to setup a basic box. reusable modules for students and small not long lasting projects. just a minimal setup
##How to use this project?
`git clone ...`

##Install vagrant (Link to vagrant.md)
* [Project specific documentation](./vagrant.md)

There are some more links which may help you troubleshooting your problems or getting more information about the vagrant technology.
* [external tutorial](https://github.com/mitchellh/vagrant)
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


###chef
###puppet



