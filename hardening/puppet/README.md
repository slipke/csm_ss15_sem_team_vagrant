TODO this is copy n pasted

# Description 
This is a collection of common hardening tasks for Ubuntu/Debian Systems written in the Chef Framework. All the cookbooks provide secure and easy to customize configurations. All settings can be changed in the central cookbook configuration file "COOKBOOK/attributes/default.rb". Every cookbook focuses on certain software components and are compatible with each other. 
They were written for developers who don't want to deal with Linux-Server configuration and still need a secure system up and running within minutes.
So all the cookbooks don't have any external dependencies, run out of the box in the chef solo mode and can be included in a vagrant script. Even not tested, they should work in the Chef Server Mode, too.

For more details about the cookbooks, please refer to the particular readme files.

## Usage
Hence the cookbooks install and change system configuration files, they must be run with root permissions.

Local Mode with Chef Client:

    * `sudo chef-client --local-mode --runlist 'recipe[COOKBOOK]'`
    
Vagrant:
    * TODO
    
    
## Contributors
* Steffen Hinderer

## License and Author
 * Author:: Steffen Hinderer steven@posteo.de
 
Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.
