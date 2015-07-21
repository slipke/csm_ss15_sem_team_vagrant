# Infrastructure as Code
The following README pages summarize our project results in the class "System Engineering and Management" in the summer semester 2015 at the [Hochschule der Medien Stuttgart](http://www.hdm-stuttgart.de/) in the major [Computer Science and Media](http://www.mi.hdm-stuttgart.de/csm). We'd like to thank our mentor and lecturer Thomas Pohl for his support and the interesting sessions.  

## Why this Project?
Virtual servers are usually short living, often just used for days or in the best case a couple of months. The Setup from scratch is tedious and time consuming. To mimize the manual work, this project wrapped common server usage szenarios with common hardening tasks into code. Two popular and Open Source frameworks where used, [Chef](https://www.chef.io/) and [Puppet](https://puppetlabs.com/). Under normal circumstances both orchestrating frameworks rely on a Master - Slave configuration, where the Master manages multiple Slaves. In this project we set great value upon a Master free approach. That way the power of orchestration works on just a single machine, too. It also cuts down the time of setting up the infrastructure. 
All the written modules encapsule only one single purpose, that simplicity makes it easy to configure and install those modules. 
To support the development process from the beginning, every module includes a Vagrant setup, with which a local Virtual Machine on the developers machine can be deployed. 
One command automatically downloads the specified Operating System, configures it with the selected modules and exposes the Virtual Machine to the host on a configurable ip address. The whole concept which was followed is, to provide a seamless and identical setup from the development to the live systems. Problems like "it worked on my developer machine" won't happen ever again. Vagrant runs on all major Operating System, as long as it can run Oracle Virtual Box.

With the help of this project, only very litte Linux administration knowledge is neccessary to setup a secure and performant developing and live server environment.
All the module can be reused, forked and edited as wanted. A compatibilty with each other goes without speaking.


## How to use this Project?
Before getting started, one has to decide on the Provisioning Framework. Please refer to chapter [which provision project should be used?](#which-provision-project-should-be-used?) for decision making support. Once the decision is made, just download or clone the git repository onto the machine you want to orchestrate. 

After installing the Provisioning Framework, as described in [Setup Chef](#setup-chef) and [Setup Puppet](#setup-puppet), all the modules can be used in the single or solo mode of each framework. For detailed information about the usage of the modules, please refer to the READMES included in each module.

### Which Provision Project should be used?
describe here our conclusion about the usage factors of puppet and chef. Which provision technology should be used for which use case / knowledge base?

@@Notes@@
Korbi's opinion: student projects: the effort which has to be invested to setup a chain with puppet / chef + vagrant can be very time consuming. If the configuration is not extraordinary, there are many setups already in the repositorys of chef and puppet. If the student does not start from sratch and instead use these projects, they can profit from a tool chain.
training curve: For me, it was easier to use puppet that chef. Maybe i start with chef and then switched to puppet.
conclusion: Dev Ops are very important in bigger companys. I think that chef is suitable for a small company which want to start with DevOps. For a big or developed company, puppet can be more profitable because of the enterprise solution and support. 

@@Notes@@ Steve: chef offers an enterprise solution as well!

## Install Vagrant (Link to vagrant.md)

* [Project specific installation documentation](./vagrant.md)

There are some more links which may help you troubleshooting your problems or getting more information about the vagrant technology.
* [external tutorial](https://github.com/mitchellh/vagrant)
* [offical vagrant documentation](https://docs.vagrantup.com/v2/)
    
## [Setup Chef](chef.md) 

## [Setup Puppet](puppet.md) 

## Used software / Available Server Modules

* Java [JBoss](https://docs.jboss.org/author/display/AS71/Documentation)
* Java [Tomcat](http://tomcat.apache.org/tomcat-6.0-doc/)
* LAMP (Linux, Apache, MySQL and PHP)
* LEMP (Linux, Nginx, MySQL and PHP)

## Available Hardening Modules
The hardening modules are a collection of common hardening tasks for Debian and Debian based Systems like Ubuntu. All hardening tasks are available for both Chef and Puppet. The Following Modules are provided:

* MySQL
* Nginx
* SSH

Detailed information can be found in the particular READMES.

## How to use librarian-puppet on windows

For the usage of librarian-puppet you have to install [Ruby](http://rubyinstaller.org/downloads/) on your Windows machine.
The librarian-puppet package needs also a puppet installation on the machine. This is also required, when you just want to download the puppet modules and install them on a guest system like a vagrant machine. It is possible that you will get SSL Authentication Errors when you start "librarian-puppet install". This is caused by non existent certificates. One fast workaround is to start your computer management and add a new envirment variable called "SSL_CERT_FILE" with the value of CHEFDK-HOME\embedded\ssl\certs\cacert.pem or download the file http://curl.haxx.se/ca/cacert.pem and point your path variable to this file.

## Introduction of used software


### chef

### puppet

## Contributors
* Steffen Hinderer
* Korbinian Kram
* Simon Lipke
* Patrik Jakober
* Sebastian Löw

## License and Author
 * Author:: Steffen Hinderer sh219@hdm-stuttgart.de
 * Author:: Korbinian Kram kk114@hdm-stuttgart.de
 * Author:: Simon Lipke	sl110@hdm-stuttgart.de
 * Author:: Patrik Jakober pj010@hdm-stuttgart.de
 * Author:: Sebastian Löw sl106@hdm-stuttgart.de
 
Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.

## Special thanks to...
...our mentor and lecturer Thomas Pohl for his support and the interesting sessions.