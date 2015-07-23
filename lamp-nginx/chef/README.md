# Installing a LAMP-Stack using Chef

This project installs and configures a simple lamp-stack with nginx, mysql and php5 on a Ubuntu 14.04 Server. 
The credentials for the mysql-user can be configured in the [default.rb](https://github.com/slipke/csm_ss15_sem_team_vagrant/blob/master/lamp-apache/chef/project_cookbooks/lampp/recipes/default.rb) file.

##Dependencies

###Installed software
If you only want to quickly setup a lamp stack just download  [vagrant](https://www.vagrantup.com/) and [virtualbox](https://www.virtualbox.org/). Additional you will need the [vagrant-berkshelf plugin](https://github.com/berkshelf/vagrant-berkshelf). For installation tutorials read the github readme of vagrant-berkshelf plugin.

###cookbooks
* [apt-get](https://supermarket.chef.io/cookbooks/apt)
* [nginx](https://supermarket.chef.io/cookbooks/apache2)
* [mysql](https://supermarket.chef.io/cookbooks/mysql)
* [php](https://supermarket.chef.io/cookbooks/php)


##Installation

###Installation with vagrant
Check first if you have installed vagrant and virtualbox.  After that just run `git clone https://github.com/slipke/csm_ss15_sem_team_vagrant.git` an navigate to /lamp-apache/chef and run `vagrant up` from your terminal

###Installation with Chef
@@@WIP@@@

## License and Author
 * Author: Patrik Jakober pj010@hdm-stuttgart.de
 
Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.
