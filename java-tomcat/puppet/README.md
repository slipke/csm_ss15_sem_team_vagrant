# Java Tomcat

This project installs a tomcat instance based on the module of [puppetlabs/tomcat](https://forge.puppetlabs.com/puppetlabs/tomcat).
If you do no other modifications and use vagrant you will find your tomcat-server under 192.168.33.45:8080.
If you use any other infrastructure you will find your tomcat-server under the servers ip:8080.
This project installs a standard management user which can be used for the web-management-portal of the tomcat server:
Username: ManTomcat
password: PwTomcat

The credentials can be modified before the installation in the 
[init.pp file](puppet/modules/comcat-config/manifests/init.pp) file.


The credentials can be modified after the installation in the tomcat-users.xml. For this use case follow the official [documentation](http://tomcat.apache.org/tomcat-6.0-doc/manager-howto.html).

##Dependencies

###installed software
If you use the vagrant solution you only have to install [vagrant](https://www.vagrantup.com/) and [virtualbox](https://www.virtualbox.org/). Additional you need to install librarian-puppet. Librarian-puppet will resolve all dependencies and download the additional required modules.  A tutorial for this  can be found [here](../../README.MD). 
If you use this project as standalone projekt you have to install puppet.

###puppet modules
* [puppetlabs-java](https://forge.puppetlabs.com/puppetlabs/java)
* [tomcat](https://forge.puppetlabs.com/puppetlabs/tomcat)


##Installation
Check first if you have installed vagrant, virtualbox, puppet and librarian-puppet. After that run the following commands:

* `git clone https://github.com/slipke/csm_ss15_sem_team_vagrant.git` and `cd lamp-apache/puppet`
* `librarian-puppet install`
* `vagrant up`


##Configuration
This project configure a management user for the management tomcat web interface. The Username is "ManTomcat" and the password is "PwTomcat" both without the quote. If you want to change these credentials you have to edit the [init.pp file](puppet/modules/tomcat-config/manifests/init.pp) file. There are two variables which are need to do this:
*	$managementUser 
*	$managementPW 

## License and Author
 * Author: Korbinian Kram korbinian@foni.net
 
Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.
