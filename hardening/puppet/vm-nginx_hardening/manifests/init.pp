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
# Set the numnber of nginx worker processes. A good start is to match the number of CPU cores.
# options: nginx default "4";  or any integer http://nginx.org/en/docs/ngx_core_module.html#worker_processes
#
# [*worker_connections*]
# Set the number of worker connections.
# options: nginx default "768", or any integer
#
# [*user*]
# standard nginx user
# Change the default user, nginx is run under. The specified unix user must exist. Nginx default "www-data". Options `String`
#
# [*server_tokens*]
# Disable the server tokens and don't show OS details on error pages.
# options: "on", "off"; disable server tokens; don't show OS details
#
# [*client_header_buffer_size*]
# Specifies the header buffer size; If you handle large cookies or other header data, increase the buffer. If this buffer does not suffice the "large_client_header_buffers" will be used. Nginx default "1k". Options: `number of kilobytes as Integer`
#
# [*large_client_header_buffers*]
# Specifies the maximum number and size of the client buffer; If you handle large cookies or other header data increase the buffer. Nginx defaul "4 8k". Options `number of buffers as Integer` and `size of buffer as Integer`
#
#
# further information about HTTP headers https://www.owasp.org/index.php/List_of_useful_HTTP_headers
#
# [*x_frame_headers*]
# Options: `DENY`, `SAMEORIGIN`, `ALLOW-FROMuri`; 
#
# [*x_content_type_options*]
# Options: `nosniff` or  `blank`
#
# [*x_xss_protection*]
# Options: `1; mode=block`, `0`, `1`
#
# [*strict_transport_security*]
# Options: `max-age= in seconds`, `includeSubdomains`, `preload`; or any combination of those options
#
# [*disable_default_site*]
# Remove the default system link from sites-enabled. Options: `true`, `false`  
#
# [*override_default_site*]
# Override the standard index.html with a blank document. Options: `true`, `false`
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