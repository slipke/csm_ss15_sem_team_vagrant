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
# == Class: mysql_hardening::update
#
# Updates the mysql-server and starts it as a service
#
class mysql_hardening::update () inherits mysql_hardening {
    
    ##
    # make sure mysql-server is the latest version and running
    ##
    
    # update repos
    exec { "apt-get update" : 
        command => "/usr/bin/apt-get update"
    }
    
    package { mysql-server :
            ensure => "latest"
        }
        
    service { mysql :
            ensure => "running"
    }  
} 
