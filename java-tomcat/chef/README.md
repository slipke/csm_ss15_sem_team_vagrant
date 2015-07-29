# Java Tomcat

This project installs a Tomcat instance based on the cookbook of [opscode-cookbooks](https://github.com/opscode-cookbooks/tomcat) with minor changes.
If you do no other modifications and use vagrant you will find your tomcat server under 192.168.33.11:8080.
If you use any other infrastructure you will find your Tomcat-Server under the servers ip:8080.
This project installs a standard management user which can be used for the Web-Management-Portal of the Tomcat-Server:
`Username: admin`
`password: password`
A normal user will also be created. The credentials are:
`Username: user`
`password: password`

The credentials can be modified before the installation in the 
[admin.json file](/data_bags/tomcat_users/admin.json) file.


The credentials can be modified after the installation in  the tomcat-users.xml. For this use case follow the official [documentation](http://tomcat.apache.org/tomcat-6.0-doc/manager-howto.html).

## Dependencies of needed Software or existing chef recieps (Cookbooks)

### needed Software
If you use the vagrant solution you only have to install [vagrant](https://www.vagrantup.com/) and [virtualbox](https://www.virtualbox.org/). Additional you will need the [vagrant-berkshelf plugin](https://github.com/berkshelf/vagrant-berkshelf). For installation tutorials read the [vagrant-berkshelf plugin](https://github.com/berkshelf/vagrant-berkshelf) README.
If you use this cookbook as a standalone project you have to install chef first.


### Cookbooks
* [apt](https://supermarket.chef.io/cookbooks/apt)
* [java](https://supermarket.chef.io/cookbooks/java)
* [tomcat](https://github.com/kkoStudyAcc/tomcat)


## Installation of this project
Check first if you have installed vagrant and virtualbox.  After that check out the project in an user writeable folder.
Open the commandline in this folder and just type: 
`vagrant up`
### Manual installation of this project
If you use this project as a standalone project, keep in mind that is only tested and verified with the Linux [hashicorp/precise32](https://atlas.hashicorp.com/hashicorp/boxes/precise32) vagrant box. If you have a vm, where you want to setup this project, you should have the [chefdk](https://downloads.chef.io/chef-dk/) installed on your vm. Berkshelf is need for the Dependency Management ( this is already included in the chefdk). When you have installed the chefdk (or chef + berkshelf),you should switch to the git repo. Now you can resolve the dependencies by typing: 
 * `berks install`

After that you can start the chef installation
 with: 
 `sudo chef-client --local-mode --runlist 'recipe[apt::default],recipe[java::default],recipe[tomcat::default],recipe[tomcat::users]'`


## Configuration of the Tomcat-Server
This project configure a management user for the management Tomcat web interface. The `Username is "admin"` and the `password is "password"` both without the quotes. If you want to change these credentials you have to edit the [admin.json file](/data_bags/tomcat_users/admin.json) file. 
The normal user configuration can be found and changed with the file [user.json](/data_bags/tomcat_users/user.json)

## License and Author
 * Author:: Korbinian Kram korbinian@foni.net
 
Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.
