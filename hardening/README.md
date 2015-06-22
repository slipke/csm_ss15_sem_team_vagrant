# System Hardening

## Description
This is a collection of common hardening tasks for Ubuntu/Debian Systems. Two of the most common configuration management tools, chef an puppet, are supported.
All the configuration scripts were written for developers who don't want to deal with Linux-Server configuration and still need a secure system up and running within minutes. Even though it is meant for short term production servers, you can also apply those cookbooks to your local development virtual machine with vagrant. The advantage is, that you then have the identical setup on your development and the production environment.
With that in mind, there are few external dependencies so you can run all the tasks out of the box in a solo/standalone mode. Even it's not tested, they should also run in the server mode of the specific configuration management tool.

Following tasks are provided:
* SSH hardening
* Nginx hardening
* MySql hardening
    
More details about the specific solutions can be found in the sections chef and puppet.

## Requirements
* [Chef Server, Client or Chef-dk](https://www.chef.io) (tested with Chef version 12.x)
* [Berkshelf](http://berkshelf.com/)

 
 OR
 
* [Puppet 3.x](https://puppetlabs.com/puppet/puppet-open-source)
 
## Platforms 
    * Debian 8 and later (tested, should work with older versions, too)
    * Ubuntu 14 and later (tested, should work with older versions, too)

## Contributors
* Steffen Hinderer

## License and Author
 * Author:: Steffen Hinderer steven@posteo.de
 
Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.