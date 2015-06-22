# Description 
This is a collection of common hardening tasks for Ubuntu/Debian Systems written in the Puppet Framework. All the modules provide secure and easy to customize configurations. All settings can be passed in the module as parameters. Every module focuses on certain software components and are compatible with each other. 
They were written for developers who don't want to deal with Linux-Server configuration and still need a secure system up and running within minutes.
So all the modules don't have any external dependencies, run out of the box in the standalone mode and can be included in a vagrant script. Even not tested, they should work in the Puppet Server Mode, too.

For more details about the cookbooks, please refer to the particular readme files.


## Requirements
    * [Puppet 3.x][https://puppetlabs.com/puppet/puppet-open-source]

## Platforms
    * Debian 8 and later (tested, should work with older versions, too)
    * Ubuntu 14 and later (tested, should work with older versions, too)

## Usage
Hence the modules install and change system configuration files, they must be run with root permissions.

### 1. Build the module:

* `sudo puppet build /path/toSource`

### 2. Install the the module:

* `sudo puppet install path/to/Source/pkg/modulename.tar.gz`

 
### 3. Create a puppet script file like the following template:

    * `node default {
        class { 'installedModuleName' :
            parameter1 => "Content" 
        }
    }`
    
### 4, Run the puppet script with:    

    * `sudo puppet apply /path/toScript'`
        
## Contributors
* Steffen Hinderer

## License and Author
 * Author:: Steffen Hinderer steven@posteo.de
 
Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.
