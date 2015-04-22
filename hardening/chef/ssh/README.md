# ssh_hardening - Chef cookbook

## Description
This chef cookbook consists of two recipes. The First easy to use recipe "usermanagement" manages users and their ssh keys on a very basic level. You can add Users and deposit a ssh key file.
The second recipe "server" provides secure ssh server configurations. Both can be used independently.
All possible settings can be found in "/attributes/default.rb" and can be tailored to your needs. 

## Requirements
* This first version only supports Debian/Ubuntu Systems.
* chef https://www.chef.io

## attributes

### User Mangement settings

* `['user'][0]['name'] 		= 'youUserName'` - the users name
* `['user'][0]['password'] 	= 'secret'` - plaintext password
* `['user'][0]['publicKey'] 	= ["thisismypublickey", "thisismypublickey2"]` - the plaintext password will be hashed with the `openssl passwd` function. leave blank if not wanted or a system user
* `['user'][0]['system'] 	= 'false'` - if true it creates a system user without a home directory and password

### SSH settings
* `['ssh']['port'] 		= [4444]`  # standard ssh port
* `['ssh']['passwordAuth']	= ['no']` # no, yes
* `['ssh']['permitRootLogin']	=['yes']` # no, without password
** you need to create a non root user and add it to the sudoers file to not lock you out of the system. You can use the usermanagement cookbook



## Usage
  sudo chef-client --local-mode --runlist 'recipe[ssh_hardening]'


## FAQ



## Contributors
* Steffen Hinderer


## License and Author
 * Author:: Steffen Hinderer steven@posteo.de
 
Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.

      