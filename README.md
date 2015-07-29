# Infrastructure as Code
The following README pages summarize our project results from the class "System Engineering and Management" in the summer semester 2015 at the [Hochschule der Medien Stuttgart](http://www.hdm-stuttgart.de/) in the major [Computer Science and Media](http://www.mi.hdm-stuttgart.de/csm).

## Why this Project?
Virtual servers are usually short living, often just used for days or in the best case a couple of months. The Setup from scratch is tedious and time consuming. To mimize the manual work, this project wrapped common server usage szenarios with common hardening tasks into code. Two popular and Open Source frameworks where used, [Chef](https://www.chef.io/) and [Puppet](https://puppetlabs.com/). Under normal circumstances both orchestrating frameworks rely on a Master - Slave configuration, where the Master manages multiple Slaves. In this project we set great value upon a Master free approach. That way the power of orchestration works on just a single machine, too. It also cuts down the time of setting up the infrastructure. 
All the written modules encapsule only one single purpose, that simplicity makes it easy to configure and install those modules. 
To support the development process from the beginning, every module includes a Vagrant setup, with which a local Virtual Machine on the developers machine can be deployed. 
One command automatically downloads the specified Operating System, configures it with the selected modules and exposes the Virtual Machine to the host on a configurable ip address. The whole concept which was followed, is to provide a seamless and identical setup from the development to the live systems. Problems like "it worked on my developer machine" won't happen ever again. Vagrant runs on all major Operating System, as long as it can run Oracle Virtual Box.

With the help of this project, only very litte Linux administration knowledge is neccessary to setup a secure and performant developing and live server environment.
All the module can be reused, forked and edited as wanted. A compatibilty with each other goes without speaking.


## How to use this Project?
Before getting started, one has to decide on the Provisioning Framework. Please refer to chapter [which provision project should be used?](#user-content-which-provision-project-should-be-used) for decision making support. Once the decision is made, just download or clone the git repository onto the machine you want to orchestrate. 

After installing the Provisioning Framework, as described in [Setup Chef](#user-content-introduction-and-setup-chef) and [Setup Puppet](#user-content-introduction-and-setup-puppet), all the modules can be used in the single or solo mode of each framework. For detailed information about the usage of the modules, please refer to the READMES included in each module.

### Which Provision Project should be used?
Chef is suitable for developer, because of the strong Ruby orientation. For a system admin Puppet will be better because of the declarative approach.
At the end it's a choice of what you prefer or what is already in use. 

## Available Server Modules

* Java JBoss Server - [Chef](/java-jboss/chef), [Puppet](/java-jboss/puppet)
* Java Tomcat Server -  [Chef](/java-tomcat/chef), [Puppet](/java-tomcat/puppet)
* LAMP (Linux, Apache, MySQL and PHP) - [Chef](/lamp-apache/chef), [Puppet](/lamp-apache/puppet)
* LEMP (Linux, Nginx, MySQL and PHP) - [Chef](/lamp-nginx/chef), [Puppet](/lamp-nginx/puppet)
* Ruby On Rails - [Chef](/ruby-on-rails/chef)

## Available Hardening Modules
The hardening modules are a collection of common hardening tasks for Debian and Debian based Systems like Ubuntu. All hardening tasks are available for both Chef and Puppet. The Following Modules are provided:

* MySQL - [Chef](/hardening/chef/mysql_hardening), [Puppet](/hardening/puppet/mysql_hardening)
* Chef Nginx - [Chef](/hardening/chef/nginx_hardening), [Puppet](/hardening/puppet/nginx_hardening)
* Chef SSH - [Chef](/hardening/chef/ssh_hardening), [Puppet](/hardening/puppet/ssh_hardening)

Detailed information can be found in the particular READMES.

## Supported Operating Systems
All modules have been tested with:

* Debian 8
* Ubuntu 14.04

Even though not tested, they also should work with previous and later Versions and other Debian based distributions.

## [Project Specific Vagrant Installation Documentation](./vagrant.md)
    
## [Introduction and Setup Chef](chef.md) 

## [Introduction and Setup Puppet](puppet.md) 

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
...our mentor and lecturer Thomas Pohl for his support and the interesting sessions, tons of information and lots of insights.
