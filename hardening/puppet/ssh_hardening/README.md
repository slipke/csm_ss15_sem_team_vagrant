# ssh_hardening - Puppet module

## Description
This module provides you with secure openssh settings. Besides that, you can manage users on a basic level. You can add new users and corresponding ssh-keys. 
All the manifests work individually aswell.

## Requirements
* [Puppet 3.x](https://puppetlabs.com/puppet/puppet-open-source)

## Platforms
    * Debian 8 and later (tested, should work with older versions, too)
    * Ubuntu 14 and later (tested, should work with older versions, too)

## Parameters
All the settings are passed in as Parameters.

## SSH-Settings
* `[*port*]` - Changes the port SSH is listening to. Options: `Integer`, default `22`.

* `[*password_auth*]` - Dissallow login with a password. Options: `yes`, `no`

* `[*permit_root_login*]` - Allow remote root login. Options: `yes`, `no`. Please add a a user you can login with to the sudo group

## Usermanagement
* `[*users*]` - This parameter creates new users. You can pass all the User information as a hash. The structure is following:

`users => {
    'nameOfUser' => {
        groups => ['yourGroup1', 'yourGroup2'], # Options: `String`;  Users groups, please add your user to the sudo group if you dissallow root login ! Don't add the standard group (the name of the user)
        password => 'passwordCryptHashed', # Options: `String`; The password, hasehd as with crypt or openssl function
        managehome => boolean, # Options: `boolean`; Should a home directory be created
        system => boolean # Options: `boolean`; Is it a system user? don't set managehome if true
        }
}`

You can extend this list with multiple users. Just comma seperate the list.

## Keymanagement
* `[*keys*]` - You can pass ssh keys for exisiting and through this script created users. This is important to do, if you deactivate password_auth. 
Pass the keys as an hash with the following structure:

`keys => {
        'nameOfUser' => { # Options: `String`; The user you want to add the key for
            user => 'nameOfUser', # Optins `String`; The user you want to add the key for
            key => 'yourPublicKey', # Options `String`; Valid values are ssh-dss (also called dsa), ssh-rsa (also called rsa), ecdsa-sha2-nistp256, ecdsa-sha2-nistp384, ecdsa-sha2-nistp521, ssh-ed25519 (also called ed25519).
            type => ssh-dss, # The type of the key: Valid values are ssh-dss (also called dsa), ssh-rsa (also called rsa), ecdsa-sha2-nistp256, ecdsa-sha2-nistp384, ecdsa-sha2-nistp521, ssh-ed25519 (also called ed25519).
        }
}`


## Usage
Since this module installs and changes system configuration files, it must be run with root privileges.

Before you can use this module you must build it. For building it, cd into the parent directory and execute following command:

    * `puppet module build yourPath/toThe/module`
    
Once the module is built, puppet created a compressed file in `/vm-nginx_hardening/pkg/vm-ssh_hardening.-0.1.0tar.gz`. 
Now install the compressed file with:

    * `puppet module install path/to/vm-ssh_hardening.-0.1.0tar.gz`

Now the module is installed on your machine and you can use the class:

    * `class { 'ssh_hardening': }`
    
Custom attributes can be passed into the module like this:
    
  * `class{ 'nginx_hardening': 
                port => "6500",     
        }`


## FAQ
If you want to exclude certain classes, please call the classes you need manually like this:

`class { 'ssh_hardening::ClassName': }`


## Contributors
* Steffen Hinderer


## License and Author
 * Author:: Steffen Hinderer sh219@hdm-stuttgart.de
 
Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.