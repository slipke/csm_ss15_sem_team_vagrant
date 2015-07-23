# Installing a LAMP-Stack using Puppet

This project installs and configures a simple lamp-stack with apache, mysql and php5 on a Ubuntu 14.04 Server. 

## Dependencies

### Installed software

If you only want to quickly setup a lamp stack just download [vagrant](https://www.vagrantup.com/) and [virtualbox](https://www.virtualbox.org/).
To install all required modules you need [librarian-puppet](https://github.com/rodjek/librarian-puppet) (`sudo gem install librarian-puppet`) and [puppet](https://puppetlabs.com) (`sudo gem install puppet`).

### Cookbooks

* [puppetlabs-apache](https://forge.puppetlabs.com/puppetlabs/apache)
* [nodes-php](https://forge.puppetlabs.com/nodes/php)
* [puppetlabs-mysql](https://forge.puppetlabs.com/puppetlabs/mysql)


## Installation

### Installation with vagrant

Check first if you have installed vagrant, virtualbox, puppet and librarian-puppet. After that run the following commands:

* `git clone https://github.com/slipke/csm_ss15_sem_team_vagrant.git` and `cd lamp-apache/puppet`
* `librarian-puppet install`
* `vagrant up`

## Configure

@@@ WIP @@@

## License and Author
 * Author: Simon Lipke sl110@hdm-stuttgart.de
 
Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.