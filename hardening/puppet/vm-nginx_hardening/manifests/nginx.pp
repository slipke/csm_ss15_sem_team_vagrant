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
# == Class: nginx_hardening::nginx
#
# Full description of class nginx_hardening::nginx here.
#
# makes sure nginx is installed and running and update openssl
#
class nginx_hardening::nginx {
    
    package { nginx:
            ensure => "installed"
    }
        
    service { nginx:
            ensure => "running"
    }    
        
    package { openssl:
            ensure => "latest"
    }    
   
    
} 
