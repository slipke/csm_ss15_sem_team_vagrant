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
# == Class: ssh_hardening::update
#
# Updates the package manager and makes sure the openssh-server package is the latest and starts it.
#
class ssh_hardening::update () {
    
    # update repos
    exec { "apt-get update": 
        command => "/usr/bin/apt-get update"
    }
    
    # update openssh-server
    package { openssh-server:
        ensure => "latest"
    }
    
    # start ssh service
    service { ssh :
         ensure => "running"
    }
} 
