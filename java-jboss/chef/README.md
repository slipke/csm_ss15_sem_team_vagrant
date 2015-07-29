# Java JBoss

This project installs a JBoss instance based on the module of [andy-dufour](https://supermarket.chef.io/cookbooks/jboss7).
If you do no other modifications and use vagrant you will find your JBoss-Server under 192.168.33.10:8080.
If you use any other infrastructure you will find your JBoss-Server under the servers ip:8080.
This project installs a standard management user which can be used for the Web-Management-Portal of the JBoss-Server:
Username: Administrator
password: changeit!

The credentials can be modified before the installation in the 
[default.rb file](/attributes/default.rb).
Keep in  mind, that the password must be inserted in the following format:
HEX( MD5( username ':' realm ':' password))

The credentials can be modified after the installation with the user.sh script. For this use case follow the official [documentation](https://docs.jboss.org/author/display/AS71/add-user+utility).

## Dependencies of needed Software or existing Chef recieps (Cookbooks)

###Needed Software
If you use the Vagrant solution you only have to install [vagrant](https://www.vagrantup.com/) and [virtualbox](https://www.virtualbox.org/). Additionally you will need the [vagrant-berkshelf plugin](https://github.com/berkshelf/vagrant-berkshelf). For installation tutorials read the [vagrant-berkshelf plugin](https://github.com/berkshelf/vagrant-berkshelf) README.
If you use this cookbook as a standalone projekt you have to install Chef.

### Cookbooks
* [apt-get](https://supermarket.chef.io/cookbooks/apt)
* [java](https://supermarket.chef.io/cookbooks/java)
* [JBoss](https://supermarket.chef.io/cookbooks/jboss7)


## Installation of this project
Check first if you have installed Vagrant and Virtualbox.  After that, check out the project in an user writeable folder.
Open the commandline in this folder and just type: vagrant up
### Manual installation of this project
If you use this project as standalone project, keep in mind that is only tested and verified with the Linux [hashicorp/precise32](https://atlas.hashicorp.com/hashicorp/boxes/precise32) Vagrant box. If you have a VM, where you want to setup this project, you should have the [chefdk](https://downloads.chef.io/chef-dk/) installed on your VM. Berkshelf is needed for the Dependency Management ( this is already included in the chefdk). When you have installed the chefdk (or Chef + berkshelf), you should switch to the git repo.

Now you can resolve the dependencies by typing: 
 * `berks install`

After that you can start the chef installation with: 
 * `sudo chef-client --local-mode --runlist 'recipe[apt]",recipe[java],recipe[jboss7],recipe[HdM-Jboss-chef::jboss-config]'`

## Configuration of the JBoss-Server
This project configures a management user for managing the JBoss web interface. The Username is `"Administrator"` and the password is `"changeit!"` both without the quote. If you want to change these credentials you have to edit the [default.rb](/attributes/default.rb) file. 
Keep in  mind, that the password must be inserted in the following format:
HEX( MD5( username ':' realm ':' password))

## License and Author
 * Author:: Korbinian Kram korbinian@foni.net
 
Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.
