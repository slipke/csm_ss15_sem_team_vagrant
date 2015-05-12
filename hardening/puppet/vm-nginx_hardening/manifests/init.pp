# === Copyright
#
# Copyright 2015, Steffen Hinderer
# Licensed under the Apache License, Version 2.0 (the "License");
# http://www.apache.org/licenses/LICENSE-2.0
#
# === Authors
#
# Author Steffen Hinderer, steven@posteo.de
#
# == Class: nginx_hardening
#
# Full description of class nginx_hardening here.
#
# === Parameters
#
# [*woker_processes*]
# options: nginx default "4";  or any integer http://nginx.org/en/docs/ngx_core_module.html#worker_processes
#
# [*worker_connections*]
# options: nginx default "768", or any integer
#
# [*user*]
# standard nginx user
#
# [*server_tokens*]
# options: "on", "off"; disable server tokens; don't show OS details
#
# [*client_header_buffer_size*]
# specify the header buffer size; if you handle large cookies or other header data increase the buffer
#
# [*large_client_header_buffers*]
# specify the max number and size of the client buffer;  if you handle large cookies or other header data increase the buffer
#
#
# further information about HTTP headers https://www.owasp.org/index.php/List_of_useful_HTTP_headers
#
# [*x_frame_headers*]
# options: "DENY", "SAMEORIGIN", "ALLOW-FROMuri"; avoid clickjacking
#
# [*x_content_type_options*]
# options: "nosniff" or leave blank
#
# [*x_xss_protection*]
# options: "1; mode=block", "0", "1"
#
# [*strict_transport_security*]
# options: "max-age= in seconds", "includeSubdomains", "preload" any combination of those options is possible
#
# [*disable_default_site*]
# options: true, false; remove the default system link from sites-enabled
#
# [*override_default_site*]
# options: true, false; override the standard index.html with a blank document 
#
class nginx_hardening (
    
    ##
    # parameters
    ##
    $worker_processes = '4', 
    $worker_connections = '768', 
    
    $user = "www-data", 
    $server_tokens = 'off', 
    $client_header_buffer_size = '1k', 
    $large_client_header_buffers = '2 1k', 
    
    $x_frame_headers = 'SAMEORIGIN',  
    $x_content_type_options = 'nosniff', 
    $x_xss_protection = '"1; mode=block"', 
    $strict_transport_security = '"max-age=31536000; includeSubdomains; preload"', 
    
    # misc
    $disable_default_site = 'true', 
    $override_default_site = 'true'  
    )
    {
            # install/update nginx
            class{ 'nginx_hardening::nginx': }
        
            # apply the new nginx.conf and restart nginx
            class{ 'nginx_hardening::config': 
                nginx => { 
                    'worker_processes' => $worker_processes,
                    'worker_connections' => $worker_connections, 
                    'user' => $user, 
                    'server_tokens' => $server_tokens, 
                    'client_header_buffer_size' => $client_header_buffer_size, 
                    'large_client_header_buffers' => $large_client_header_buffers, 
                    'X_Frame_Headers' => $x_frame_headers,  
                    'X_Content_Type_Options' => $x_content_type_options, 
                    'X_XSS_Protection' => $x_xss_protection, 
                    'Strict_Transport_Security' => $strict_transport_security, 
                    'disable_default_site' => $disable_default_site,
                    'override_default_site' => $override_default_site 
                }
            }  
}