# Infrastructure as Code
The following README pages summarize our project results for the class "System Engineering and Management" in the summer semester 2015 at the [Hochschule der Medien Stuttgart](http://www.hdm-stuttgart.de/) in the major [Computer Science and Media](http://www.mi.hdm-stuttgart.de/csm). We'd like to thank our mentor and lecturer Thomas Pohl for his support and the interesting sessions.  

## Why this project?
virtual servers can be short living, often used just for days or in best case months. The setup is tedious and time consuming. To mimize the work this project wrapped common server szenarios with common hardening tasks into code. Two popular and open source framework where used, chef and puppet.

It is intended for people who cant use a chef server or dont want or its not worth to set one up. easy and works out of the box after installing chef-client/chef-server
Simple modules made it easy to setup a basic box. reusable modules for students and small not long lasting projects. just a minimal setup
## How to use this project?
`git clone ...`
### which provision project should be used?
describe here our conclusion about the usage factors of puppet and chef. Which provision technology should be used for which use case / knowledge base?

<<<<<<< Updated upstream
<<<<<<< Updated upstream
@@Notes@@
Korbi's opinion: student projects: the effort which has to be invested to setup a chain with puppet / chef + vagrant can be very time consuming. If the configuration is not extraordinary, there are many setups already in the repositorys of chef and puppet. If the student does not start from sratch and instead use these projects, they can profit from a tool chain.
training curve: For me, it was easier to use puppet that chef. Maybe i start with chef and then switched to puppet.
conclusion: Dev Ops are very important in bigger companys. I think that chef is suitable for a small company which want to start with DevOps. For a big or developed company, puppet can be more profitable because of the enterprise solution and support. 

##Install vagrant (Link to vagrant.md)
=======
## Install vagrant (Link to vagrant.md)
>>>>>>> Stashed changes
=======
## Install vagrant (Link to vagrant.md)
>>>>>>> Stashed changes
* [Project specific installation documentation](./vagrant.md)

There are some more links which may help you troubleshooting your problems or getting more information about the vagrant technology.
* [external tutorial](https://github.com/mitchellh/vagrant)
* [offical vagrant documentation](https://docs.vagrantup.com/v2/)
    
## Setup chef (Link to chef.md)
## Setup puppet (Link to puppet.md)

## Used software

* Java [JBoss](https://docs.jboss.org/author/display/AS71/Documentation)
* Java [Tomcat](http://tomcat.apache.org/tomcat-6.0-doc/)
* LAMP (Link to lamp-apache)
* LNMP (nginx instead of apache) (Link to lamp-nginx)

## How to use hardening

* Chef
* Puppet

## How to use librarian-puppet on windows

For the usage of librarian-puppet you have to install [Ruby](http://rubyinstaller.org/downloads/) on your Windows machine.
The librarian-puppet package needs also a puppet installation on the machine. This is also required, when you just want to download the puppet modules and install them on a guest system like a vagrant machine. It is possible that you will get SSL Authentication Errors when you start "librarian-puppet install". This is caused by non existent certificates. One fast workaround is to start your computer management and add a new envirment variable called "SSL_CERT_FILE" with the value of CHEFDK-HOME\embedded\ssl\certs\cacert.pem or download the file http://curl.haxx.se/ca/cacert.pem and point your path variable to this file.

## Introduction of used software
<<<<<<< Updated upstream


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
=======
>>>>>>> Stashed changes

http://www.apache.org/licenses/LICENSE-2.0

<<<<<<< Updated upstream
=======
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

>>>>>>> Stashed changes
Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.



