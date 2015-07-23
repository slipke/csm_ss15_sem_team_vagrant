# mysql_hardening - Chef cookbook

## Description
This cookbook installs or updates the mysql package via the system package manager and runs several securing actions. 
Essentially this cookbook rewrites the, already in the mysql-server package included, "mysql_secure_installation" script for chef automation.
The hardening and install/update recipes are seperate and can be included or excluded at will.

## Requirements
* [Chef Server, Client or Chef-dk](https://www.chef.io) (tested with Chef version 12.x)
* [Berkshelf](http://berkshelf.com/)

## Platforms 
* Debian 8 and later (tested, should work with older versions, too)
* Ubuntu 14 and later (tested, should work with older versions, too)

## Dependencies
The [opscode apt cookbook](https://github.com/opscode-cookbooks/apt) makes sure, the apt reposítory list is up to date. 
Berkshelf is used as a dependency management tool. To resolve and install all the Dependencies cd into the directory and execute following command:

### Berkshelf3
* `berks vendor cookbooks`

### Berkshelf 2
* `berks install --path cookbooks`

## Attributes
The file "attributes/default.rb" acts as a central configuration file.

* `default['mysql']['change_root_password']`   = true - change the password for the mysql root user. Options: `true`, `false` 
* `default['mysql']['root_password']`  = '' - Password for the mysql root user. If you install mysql through this script the root password will be blank. Options: `String`; default: blank
* `default['mysql']['new_root_password']`  = 'PW' - the new password for the mysql root user. Options: `String`
* `default['mysql']['remove_anonmymous_user']` = true - the MySql default settings allow anonymous users (black user name) to connect to the database, true will remove this behavior. Options: `true`, `false` 
* `default['mysql']['disallow_root_login']` = true - dissallow remote root login. Root login will only be possible from localhost. Options: `true`, `false` 
* `default['mysql']['remove_test_database']` = true - This option removes the default test database, which every user can access. Options: `true`, `false` 

## Usage
CD into the hardening folder and execute the command below. Hence this cookbooks installs and changes system configuration files, it must be run with root privileges.

* `sudo chef-client --local-mode --runlist 'recipe[mysql_hardening]'`

## FAQ
* If you don't want to update or install the mysql package from the system mananger, remove the line `include_recipe "mysql_hardening::check_mysql"` from "recipes/default.rb"    

## Contributors
* Steffen Hinderer

## License and Author
 * Author:: Steffen Hinderer sh219@hdm-stuttgart.de
 
Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.