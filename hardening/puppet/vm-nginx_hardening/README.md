# nginx_hardening - Puppet module

## Description
This module brings secure nginx settings to your system. It installs/updates the openssl and nginx package and provides you with a secure and easy to manage nginx configuration. 
All changes are made in "/etc/nginx/nginx.conf". Besides the nginx hardening, this cookbook also gives you the option of a very basic, tailored system optimization. 
Please refer to the section "Attributes" for furhter information. The hardening and install/update recipes are seperate and can be included or excluded at will.

## Requirements
* Puppet

## Platforms 
    * Debian 8 and later (tested, should work with older versions, too)
    * Ubuntu 14 and later (tested, should work with older versions, too)
    
# Parameters
[*woker_processes*]
Set the numnber of nginx worker processes. A good start is to match the number of CPU cores.
options: nginx default `"4"`;  or any `integer` http://nginx.org/en/docs/ngx_core_module.html#worker_processes

[*worker_connections*]
Set the number of worker connections.
Options: nginx default `"768"`, or any `integer`

[*user*]
standard nginx user
Change the default user, nginx is run under. The specified unix user must exist. Nginx default `"www-data"`. Options `String`

[*server_tokens*]
Disable the server tokens and don't show OS details on error pages.
options: `"on"`, `"off"`; disable server tokens; don't show OS details

[*client_header_buffer_size*]
Specifies the header buffer size; If you handle large cookies or other header data, increase the buffer. If this buffer does not suffice the "large_client_header_buffers" will be used. Nginx default "1k". Options: `number of kilobytes as Integer`

[*large_client_header_buffers*]
Specifies the maximum number and size of the client buffer; If you handle large cookies or other header data increase the buffer. Nginx defaul "4 8k". Options `number of buffers as Integer` and `size of buffer as Integer`


further information about HTTP headers https://www.owasp.org/index.php/List_of_useful_HTTP_headers

[*x_frame_headers*]
Options: `DENY`, `SAMEORIGIN`, `ALLOW-FROMuri`; 

[*x_content_type_options*]
Options: `nosniff` or  `blank`

[*x_xss_protection*]
Options: `1; mode=block`, `0`, `1`

[*strict_transport_security*]
Options: `max-age= in seconds`, `includeSubdomains`, `preload`; or any combination of those options

[*disable_default_site*]
Remove the default system link from sites-enabled. Options: `true`, `false`  

[*override_default_site*]
Override the standard index.html with a blank document. Options: `true`, `false`

# Usage 
Since this module installs and changes system configuration files, it must be run with root privileges.

Before you can use this module you must build it. For building it, cd into the parent directory and execute following command:

    * `puppet module build yourPath/toThe/module`
    
Once the module is built, puppet created a compressed file in `/vm-nginx_hardening/pkg/vm-nginx_hardening.-0.1.0tar.gz`. 
Now install the compressed file with:

    * `puppet module install path/to/vm-nginx_hardening.-0.1.0tar.gz`

Ńow the module is installed on your machine and you can use the class:

    * `class { 'nginx_hardening': }
    
Custom attributes can be passed into the module like this:
    
  * `class{ 'nginx_hardening': 
                worker_processes => "18",     
        }`
        
## FAQ
If you don't want to update nginx and openssl, run the following command instead:

    * `class { 'nginx_hardening::config': }

## Contributors
* Steffen Hinderer


## License and Author
 * Author:: Steffen Hinderer steven@posteo.de
 
Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.