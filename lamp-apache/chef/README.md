# Installing a LAMP-Stack using Chef

This project installs and configures a simple lamp-stack with apache2, mysql and php5 on a Ubuntu 14.04 Server. 
The credentials for the mysql-user can be configured in the [default.rb](https://github.com/slipke/csm_ss15_sem_team_vagrant/blob/master/lamp-apache/chef/project_cookbooks/lampp/recipes/default.rb) file.

##Dependencies

###Installed software
If you only want to quickly setup a lamp stack just download  [vagrant](https://www.vagrantup.com/) and [virtualbox](https://www.virtualbox.org/). Additional you will need the [vagrant-berkshelf plugin](https://github.com/berkshelf/vagrant-berkshelf). For installation tutorials read the github readme of vagrant-berkshelf plugin.

###cookbooks
* [apt-get](https://supermarket.chef.io/cookbooks/apt)
* [apache](https://supermarket.chef.io/cookbooks/apache2)
* [mysql](https://supermarket.chef.io/cookbooks/mysql)
* [php](https://supermarket.chef.io/cookbooks/php)


##Installation

###Installation with vagrant
Check first if you have installed vagrant and virtualbox.  After that just run `git clone https://github.com/slipke/csm_ss15_sem_team_vagrant.git` an navigate to /lamp-apache/chef and run `vagrant up` from your terminal

###Installation with Chef
@@@WIP@@@
