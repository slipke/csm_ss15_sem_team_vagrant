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
# == Class: ssh_hardening::server
#
#
# Takes the parameters and populates the sshd_conf.erb file.
# Once populated it is written to the host system and openssh-server is beeing restarted
#

class ssh_hardening::server ($settings) {

    # apply settings to config root:root 600 and restart ssh-service
    file {"/etc/ssh/sshd_conf" :
            ensure => present,
            path  => "/etc/ssh/sshd_conf",
            owner => vm,
            group => vm,
            mode => 600,
            content => template('ssh_hardening/sshd_conf.erb'),
            notify => Service[ssh]
    }
    
}
    
