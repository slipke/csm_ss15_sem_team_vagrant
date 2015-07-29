# Description 
The cookbook where written for the Chef Framework in Version 12.x. This cookbooks installes Ruby and Rails. In the second step a default rails applikation will be created and the rails server started. All settings can be changed in the configuration file "/attributes/default.rb".
To get get started quickly, there is only one external dependencies, see section [Dependencies](#dependencies). Once resolved they run out of the box in the chef solo mode and can be included in a Vagrant script. Even not tested, they should work in the Chef Server Mode, too.


## Requirements
* [Chef Server, Client or Chef-dk](https://www.chef.io) (tested with Chef version 12.x)
* [Berkshelf](http://berkshelf.com/)

## Platforms 
    * Debian 8 and later (tested, should work with older versions, too)
    * Ubuntu 14 and later (tested, should work with older versions, too)

## Dependencies
The [opscode apt cookbook](https://github.com/opscode-cookbooks/apt) makes sure, the apt reposítory list is up to date. 
Berkshelf is used as a dependency management tool. To resolve and install all the dependencies `cd` into the directory and execute following command:

### Berkshelf3
    * berks vendor cookbooks

### Berkshelf 2
    * berks install --path cookbooks

## Usage
Hence the cookbooks install and change system configuration files, they must be run with root permissions.

Local Mode with Chef Client:

    * sudo chef-client --local-mode --runlist 'recipe[ruby_on_rails]'
    
    
## Contributors
* Sebastian Löw

## License and Author
 * Author:: Sebastian Löw sl106@hdm-stuttgart.de
 
Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.
