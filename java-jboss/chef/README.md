# Java JBoss

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

##Dependencies

###installed software
If you use the vagrant solution you only have to install [vagrant](https://www.vagrantup.com/) and [virtualbox](https://www.virtualbox.org/). Additional you will need the [vagrant-berkshelf plugin](https://github.com/berkshelf/vagrant-berkshelf). For installation tutorials read the github readme of vagrant-berkshelf plugin.
If you use this cookbook as standalone projekt you have to install chef.

###cookbooks
* [apt-get](https://supermarket.chef.io/cookbooks/apt)
* [java](https://supermarket.chef.io/cookbooks/java)
* [jboss](https://supermarket.chef.io/cookbooks/jboss7)


##Installation
Check first if you have installed vagrant and virtualbox.  After that check out the project in an user writeable folder.
Open a terminal / commandline in this folder and just type: vagrant up
###manual
If you use this project as standalone project, kepp in mind that is only tested and verified with the linux hashicorp/precise32 vagrant box. If you have a vm where you want to setup this project, you should have the [chefdk](https://downloads.chef.io/chef-dk/) installed on your vm. Berkshelf is need for the Dependency Management ( this is already included in the chefdk). When you have installed the chefdk (or chef + berkshelf),you should switch to the git repo.

Now you can resolve the dependencies by typing "berks install". After that you can start the chef installation
 with: 
 `sudo chef-client --local-mode --runlist 'recipe[apt]",recipe[java],recipe[jboss7],recipe[HdM-Jboss-chef::jboss-config]'`

##Configuration
This project configure a management user for the management jboss web interface. The Username is "Administrator" and the password is "changeit!" both without the quote. If you want to change these credentials you have to edit the [default.rb](/attributes/default.rb) file. 
Keep in  mind, that the password must be insert in the following format:
HEX( MD5( username ':' realm ':' password))

## License and Author
 * Author:: Korbinian Kram korbinian@foni.net
 
Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.
