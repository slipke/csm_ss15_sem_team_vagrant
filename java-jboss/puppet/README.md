# Java JBoss

This project installs a JBoss instance based on the module of [example42/jboss](https://forge.puppetlabs.com/example42/jboss).
If you do no other modifications and use vagrant you will find your JBoss-Server under 192.168.33.10:8080.
If you use any other infrastructure you will find your JBoss-Server under the servers ip:8080.
The management interface is bound to port 9900.
This project installs a standard management user which can be used for the Web-Management-Portal of the JBoss-Server:
`Username: Administrator`
`password: changeit!`

The credentials can be modified before the installation in the 
[init.pp file](puppet/modules/jboss-config/manifests/init.pp) file.
Keep in  mind, that the password must be insert in the following format:
HEX( MD5( username ':' realm ':' password))

The credentials can be modified after the installation with the user.sh script. For this use case follow the official [documentation](https://docs.jboss.org/author/display/AS71/add-user+utility) on:

## Dependencies of needed Software or existing Puppet Modules

###Needed Software
If you use the Vagrant solution you only have to install [vagrant](https://www.vagrantup.com/) and [virtualbox](https://www.virtualbox.org/). Additional you need to install librarian-puppet. Librarian-puppet will resolve all dependencies and download the additional required modules.  A tutorial for this  can be found [here](../../README.MD). 
If you use this project as a standalone project you have to install Ouppet first.

### Puppet Modules
* [puppetlabs-java](https://forge.puppetlabs.com/puppetlabs/java)
* [jboss](https://forge.puppetlabs.com/example42/jboss)


## Installation of this project
Check first if you have installed Vagrant, Virtualbox, Puppet and librarian-puppet. After that run the following commands:

* `git clone https://github.com/slipke/csm_ss15_sem_team_vagrant.git` and `cd lamp-apache/puppet`
* `librarian-puppet install`
* `vagrant up`


## Configuration of the JBoss-Server
This project configure a management user for the management JBoss web interface. The Username is "Administrator" and the password is "changeit!" both without the quote. If you want to change these credentials you have to edit the [init.pp file](puppet/modules/jboss-config/manifests/init.pp) file. There are two variables which are need to do this:
* $admin_user
*$admin_pass
Keep in  mind, that the password must be insert in the following format:
HEX( MD5( username ':' realm ':' password))

## License and Author
 * Author:: Korbinian Kram korbinian@foni.net
 
Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.
