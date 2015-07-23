# nginx_hardening - Chef cookbook

## Description
This cookbook brings secure nginx settings to your system. It installs/updates the openssl and nginx package and provides you with a secure and easy to manage nginx configuration. 
All changes are made in "/etc/nginx/nginx.conf". Besides the nginx hardening, this cookbook also gives you the option of a very basic, tailored system optimization. 
Please refer to the section [Attributes](#Attributes) for further information. The hardening and install/update recipes are seperate and can be included or excluded at will.

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
    * berks vendor cookbooks

### Berkshelf 2
    * berks install --path cookbooks

## Attributes
The file "attributes/default.rb" acts as a central configuration file.

### general
* `default['nginx']['worker_processes'] = 'auto'` - Set the number of nginx worker processes. A good start is to match the number of CPU cores. Nginx default is "4". Options: `auto` (will get the number of CPU cores) or `Integer` more information [Nginx Documentation](http://nginx.org/en/docs/ngx_core_module.html#worker_processes)
* `default['nginx']['worker_connections'] = 'auto'` - Set the number of worker connections. Nginx default is "768". Options: `auto` (gets users ressource limits) or `Integer`
* `default['nginx']['user'] = ['www-data']` - Change the default user, nginx is run under. The specified unix user must exist. Nginx default "www-data". Options `String`
* `default['nginx']['server_tokens'] = ['off']` - Disable the server tokens and don't show OS details on error pages. Nginx default "on" Options: `on`, `off`
* `default['nginx']['client_header_buffer_size'] = ['1k']` - Specifies the header buffer size; If you handle large cookies or other header data, increase the buffer. If this buffer does not suffice the "large_client_header_buffers" will be used. Nginx default "1k". Options: `number of kilobytes as Integer`
* `default['nginx']['large_client_header_buffers'] = ['2 1k']` - Specifies the maximum number and size of the client buffer; If you handle large cookies or other header data increase the buffer. Nginx defaul "4 8k". Options `number of buffers as Integer` and `size of buffer as Integer`

further information about HTTP headers [OWASP](https://www.owasp.org/index.php/List_of_useful_HTTP_headers)

### Headers
* `default['nginx']['X_Frame_Headers'] = ['SAMEORIGIN']` - Options: `DENY`, `SAMEORIGIN`, `ALLOW-FROMuri`; 
* `default['nginx']['X_Content_Type_Options'] = ['nosniff']` - Options: `nosniff` or  `blank`
* `default['nginx']['X_XSS_Protection'] = ['"1; mode=block"']` - Options: `1; mode=block`, `0`, `1`
* `default['nginx']['Strict_Transport_Security'] = ['"max-age=31536000; includeSubdomains; preload"']` - Options: `max-age= in seconds`, `includeSubdomains`, `preload`; or any combination of those options
                                                        
### misc
* `default['nginx']['disable_default_site'] = 'true'` - Remove the default system link from sites-enabled. Options: `true`, `false`                                                     
* `default['nginx']['override_default_site'] = 'true'` - Override the standard index.html with a blank document. Options: `true`, `false`


## Usage
CD into the hardening folder and execute the command below. Hence this cookbooks installs and changes system configuration files, it must be run with root privileges.

* `sudo chef-client --local-mode --runlist 'recipe[nginx_hardening]'`

## FAQ
	* If you don't want to update or install the nginx package from the system mananger, remove the line `include_recipe "nginx_hardening::check_nginx"` from "recipes/default.rb"

## Contributors
* Steffen Hinderer


## License and Author
 * Author:: Steffen Hinderer sh219@hdm-stuttgart.de
 
Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.
