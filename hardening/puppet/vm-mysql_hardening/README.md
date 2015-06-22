# mysql_hardening - Puppet module

## Description
This module installs or updates the mysql package via the system package manager and runs several securing actions. 
Essentially this module rewrites the, already in the mysql-server package included, "mysql_secure_installation" script for puppet automation.
The hardening and install/update modules are seperate and can be included or excluded at will.

## Requirements
* [Puppet 3.x](https://puppetlabs.com/puppet/puppet-open-source)

## Platforms 
    * Debian 8 and later (tested, should work with older versions, too)
    * Ubuntu 14 and later (tested, should work with older versions, too)
    
# Parameters
* `[*change_mysql_pw*]` - change the password for the mysql root user. Options: `true`, `false` 

* `[*mysql_root_pw*]` - Password for the mysql root user. If you install mysql through this script the root password will be blank. Options: `String`; default: blank

* `[*new_mysql_root_pw*]` - the new password for the mysql root user. Options: `String`

* `[*remove_anonymous_user*]` - the MySql default settings allow anonymous users (black user name) to connect to the database, true will remove this behavior. Options: `true`, `false`  

* `[*deactivate_remote_host*]` - dissallow remote root login. Root login will only be possible from localhost. Options: `true`, `false` 

* `[*delete_demo_database*]` - This option removes the default test database, which every user can access. Options: `true`, `false` 


# Usage 
Since this module installs and changes system configuration files, it must be run with root privileges.

The following stept show you the process with terminal commands

### 1. Build the module:

    * `puppet module build yourPath/toThe/module`
    
Once the module is built, puppet created a compressed file in `/vm-nginx_hardening/pkg/mysql_hardening.-0.1.0tar.gz`. 

### 2. Install the the module:

    * `puppet module install path/to/mysql_hardening.-0.1.0tar.gz`

### 3. Ńow the module is installed on your machine and you can use the class:


    * `class { 'mysql_hardening': }
    
### 4. Custom attributes can be passed into the module like this:
    
* `class{ 'nginx_hardening': 
                change_mysql_pw => true,     
        }`

## FAQ
If you don't want to update mysql-server, run the following command instead:

    * `class { 'mysql_hardening::hardening': }`

## Contributors
* Steffen Hinderer


## License and Author
 * Author:: Steffen Hinderer steven@posteo.de
 
Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.