# Description 

All manifests where written for the Puppet Framework in Version 3.7.x. Each module focuses on one specific hardening task and are compatible with each other. They provide secure and easy to customize configurations. All settings can be passed in the module as parameters.
To get started quickly, all the modules don't have any external dependencies, run out of the box in the standalone mode and can be included in a Vagrant script. Even not tested, they should work in the Puppet Server Mode, too.

For more details about the cookbooks, please refer to the particular readme files.


## Requirements
* [Puppet 3.x](https://puppetlabs.com/puppet/puppet-open-source)

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
    
### 4. Run the puppet script with:    

    * `sudo puppet apply /path/toScript'`
        
## Contributors
* Steffen Hinderer

## License and Author
 * Author:: Steffen Hinderer sh219@hdm-stuttgart.de
 
Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.
