# nginx_hardening - Chef cookbook

## Description
This cookbook brings secure nginx settings to your system. It installs/updates the openssl package and provides you with a secure an easy to manage nginx configuration. 
All changes are made in "/etc/nginx/nginx.conf". Besides the nginx hardening, this cookbook also gives you the option of a very basic system tailored optimization. Please refer to the section "Attributes" for furhter information.


## Requirements

* This first version only supports Debian/Ubuntu Systems.
* chef https://www.chef.io

## Attributes
All attributes can be found an editet in "attributes/default.rb"

* default['nginx']['worker_processes'] 			= 'auto'  # options: "auto" - get nbr. of core; nginx default "4";  or any integer http://nginx.org/en/docs/ngx_core_module.html#worker_processes
* default['nginx']['worker_connections'] 		= 'auto'  # options: "auto" - get user ressource limits; nginx default "768", or any integer
* default['nginx']['user'] 				= ['www-data']  # standard nginx user
* default['nginx']['server_tokens'] 			= ['off']  # options: "on", "off"; disable server tokens; don't show OS details
* default['nginx']['client_header_buffer_size'] 	= ['1k']  # specify the header buffer size; if you handle large cookies or other header data increase the buffer
* default['nginx']['large_client_header_buffers'] 	= ['2 1k']  # specify the max number and size of the client buffer;  if you handle large cookies or other header data increase the buffer

# further information about HTTP headers https://www.owasp.org/index.php/List_of_useful_HTTP_headers
* default['nginx']['X_Frame_Headers'] 			= ['SAMEORIGIN']  # options: "DENY", "SAMEORIGIN", "ALLOW-FROMuri"; avoid clickjacking 
* default['nginx']['X_Content_Type_Options'] 		= ['nosniff']  # options: "nosniff" or leave blank
* default['nginx']['X_XSS_Protection'] 			= ['"1; mode=block";']  # options: "1; mode=block", "0", "1"
* default['nginx']['Strict_Transport_Security'] 	= ['"max-age=31536000; includeSubdomains;" preload;'] # options: "max-age= in seconds", "includeSubdomains", "preload"; any combination of those options is possible
                                                           
# misc
* default['nginx']['disable_default_site']		= 'true' # options: true, false; remove the default system link from sites-enabled 	                                                    
* default['nginx']['override_default_site']		= 'true' # options: true, false; override the standard index.html with a blank document 	


## Usage
TODO 

  sudo chef-client --local-mode --runlist 'recipe[nginx_hardening]'

## FAQ
TODO 
* The check_nginx cookbook installs the lates nginx version out of your repository. If you want to stick to your current version, please exclude this recipe.

## Contributors
* Steffen Hinderer


## License and Author
 * Author:: Steffen Hinderer steven@posteo.de
 
Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.