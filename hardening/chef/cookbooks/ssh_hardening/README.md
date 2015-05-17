# ssh_hardening - Chef cookbook

## Description
This chef cookbook consists of two recipes. The First, an easy to use recipe, "usermanagement" manages users and their ssh keys on a very basic level. You can add users and deposit a ssh key file.
The second recipe "server" provides secure ssh server configurations. Both can be used independently.

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

### User Management settings
This recipe creates new System-Users and puts specified SSH keys into the folder `/home/yourUserName/.ssh`. It also adds the created users to the group `sudo` if wanted. You can add more than one users if you copy and paste all the `user` entries and increment the array key. For example `['user'][1]['name']` for a second user.

* `['user'][0]['name'] 			= 'youUserName'`	The name of the new user. Options `String`
* `['user'][0]['password'] 		= 'secret'`	-	The users password as plaintext. It will be hashed with the `openssl passwd` function by the recipe. Options: `String` or `blank` if system user
* `['user'][0]['publicKey'] 	        = ["thisismypublickey", "thisismypublickey2"]`	-	Add the public keys for SSH login, seperated by ",". Options: SSH Keys (rsa, dsa) as `String`
* `['user'][0]['sudo']              	= false`	-	Adds the user to the sudo group to gain root privileges if needed. Options: `true`, `false`
* `['user'][0]['system'] 		= false`	-	If true it creates a system user without a home directory and password. Options: `true`, `false`

### SSH settings
* `['ssh']['port'] 			= [22]`	-	        Change the systems SSH port. Default is "22". Options: `Integer`
* `['ssh']['passwordAuth']		= ['no']`	-	Allow remote login via password or SSH key only. Options: `no`, `yes`
* `['ssh']['permitRootLogin']	        = ['yes']`	-	Allow remote root login. This does not affect the sudo option from above. Options: `no`, `without password`

## Usage
CD into the hardening folder and execute the command below. Hence this cookbooks installs and changes system configuration files, it must be run with root privileges.
  
  * `sudo chef-client --local-mode --runlist 'recipe[ssh_hardening]'`
  
Vagrant:
    * TODO


## FAQ
	* If you don't want to manage your users manually or with another recipe, remove the line `include_recipe "ssh_hardening::usermanagement"` from "recipes/default.rb"
	* If you do not permit a remote root login, you need to create a non root user and add it to the sudoers file to not lock yourself out of the system. You can use the usermanagement recipe.
	* If you do not permit a remote login via password, you need to add an SSH key.
	* If you change the SSH port, add a firewall rule to still get access to the system.


## Contributors
* Steffen Hinderer


## License and Author
 * Author:: Steffen Hinderer steven@posteo.de
 
Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.