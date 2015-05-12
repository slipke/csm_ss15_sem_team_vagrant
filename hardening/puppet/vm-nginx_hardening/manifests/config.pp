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
# == Class: nginx_hardening::config
#
# Full description of class nginx_hardening::config here.
#
# Takes the parameters and populates the nginx.conf.erb file.
# Once populated it is written to the host system and nginx gets restarted
#
class nginx_hardening::config ($nginx) inherits nginx_hardening {
    
        file { "/etc/nginx/nginx.conf":
            ensure => present,
            path  => "/etc/nginx/nginx.conf",
            owner => root,
            group => root,
            mode => 644,
            content => template('nginx_hardening/nginx.conf.erb'),
            notify => Service[nginx]
        }
        
        # remove the sys link from sites-enabled
        if $nginx['disable_default_site'] == 'true' {
            file { "/etc/nginx/sites-enabled/default" :
                ensure => absent
            }
        }
        
        # remove the standard index.html and replace it with an empty
        if $nginx['disable_default_site'] == 'true' {
            file { "/usr/share/nginx/html/index.html" :
                ensure => present,
                content => ""
            }
        }
} 