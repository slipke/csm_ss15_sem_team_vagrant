# Java JBoss

##Description
This project installs and configures a java jboss server.
Either Chef and puppet are supported to automatically run the necessary tasks. The scripts speed up the process of setting up a fully equipped java jboss server for people who don't want to deal with details.
This folder contains the two provisioning possibilities for jboss. Both install a jboss 7 server with an management user. The folders names state the used provivision technology.  Further information can be found under [chef/README.md](chef/README.md) and [puppet/README.md](puppet/README.md).


##Requirements
* Chef (tested with version 12.x - should work with all version older than 11.x)
* Puppet (tested with version 3.7)

##Platforms
* Ubuntu 14 and older (should also work on later versions)
* Debian 8 and later

## License and Author
 * Author:: Korbinian Kram korbinian@foni.net
 
Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.
