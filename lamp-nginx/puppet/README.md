# Installing a LAMP-Stack using Puppet

This project installs and configures a simple lamp-stack with nginx, MySQL and PHP5 on a Ubuntu 14.04 Server. 

## Dependencies

### Installed software

For a simple development installation you need the following software:

* [vagrant](https://www.vagrantup.com/)
* [virtualbox](https://www.virtualbox.org/)

To install all required dependencies (modules) you need:

* [puppet](https://puppetlabs.com)
* [librarian-puppet](https://github.com/rodjek/librarian-puppet)

### Used Cookbooks

* [jfryman-nginx](https://forge.puppetlabs.com/jfryman/nginx)
* [mayflower-php](https://forge.puppetlabs.com/mayflower/php)
* [puppetlabs-mysql](https://forge.puppetlabs.com/puppetlabs/mysql)

## Installation

### Installation with vagrant

Check first if you have installed vagrant, virtualbox, puppet and librarian-puppet. After that run the following commands:

* `git clone https://github.com/slipke/csm_ss15_sem_team_vagrant.git` and `cd lamp-nginx/puppet`
* `librarian-puppet install`
* `vagrant up`

## Configure

The basic version of our code installs a plain nginx, PHP and MySQL server. Nginx has one vhost called `dev.local`, which uses the path `/var/www/html` as root. MySQL is configured with the root password `root` and one database called `test`.

To configure nginx, you can adjust the line `class { 'nginx': }`, i.e. if you want to install precompiled nginx from passenger, you can replace the code with the following:

```
class { 'nginx':
    package_source  => 'passenger'
}
```

If you want to configure PHP, you need [hiera](http://docs.puppetlabs.com/hiera/latest/) installed, then you can add and change the hiera.yml as described in the [documentation](http://php.puppet.mayflower.de).
Additionally, if you want to change the MySQL settings, just have a look at the [MySQL documentation](https://forge.puppetlabs.com/puppetlabs/mysql).

## License and Author
 * Author: Simon Lipke sl110@hdm-stuttgart.de
 
Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.