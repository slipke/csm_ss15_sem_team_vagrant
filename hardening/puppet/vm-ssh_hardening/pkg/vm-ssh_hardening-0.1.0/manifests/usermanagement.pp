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
# == Class: ssh_hardening::usermanagement
#
# Adds the specified users and ssh keys.
#

class ssh_hardening::usermanagement ($users, $keys) {
    $defaults = { 
        'notify' => Service["ssh"]
    }
    
    # add user and groups
    create_resources(user, $users, $defaults)
    
    # add ssh keys for users
    create_resources(ssh_authorized_key, $keys, $defaults)
    
}
