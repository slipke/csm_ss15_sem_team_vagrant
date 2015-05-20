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
# == Class: ssh_hardening
#
# Full description of class ssh_hardening here.
#
# === Parameters
#
# [*port*]
# Changes the port SSH is listening to. Options: Integer, default 22.
#
# [*password_auth*]
# Dissallow login with a password. Options: yes, no
#
# [*permit_root_login*]
# Allow remote root login. Options: yes, no
# Please add a a user you can login with to the sudo group
#
# [*users*]
# This parameter creates new users. You can pass all the User information as a hash. The structure is following:
#
#   $users = {
#        'nameOfUser' => {
#          groups => ['yourGroup1', 'yourGroup2'], # Options: String;  Users groups, please add your user to the sudo group if you dissallow root login !
#             password => 'passwordCryptHashed', # Options: String; The password, hasehd as with crypt or openssl function
#           managehome => boolean, # Options: boolean; Should a home directory be created
#           system => boolean # Options: boolean; Is it a system user? don't set managehome if true
#           }
#   }
#
# You can extend this list with multiple users. Just comma seperate the list.
#
# [*keys*]
# You can pass ssh keys for exisiting and through this script created users. This is important to do, if you deactivate password_auth. 
# Pass the keys as an hash with the following structure:
#
#     $keys = {
#             'nameOfUser' => { # Options: String; The user you want to add the key for
#                 user => 'nameOfUser', # Optins String; The user you want to add the key for
#                 key => 'yourPublicKey', # Options String; Valid values are ssh-dss (also called dsa), ssh-rsa (also called rsa), ecdsa-sha2-nistp256, ecdsa-sha2-nistp384, ecdsa-sha2-nistp521, ssh-ed25519 (also called ed25519).
#                 type => ssh-dss, # The type of the key: Valid values are ssh-dss (also called dsa), ssh-rsa (also called rsa), ecdsa-sha2-nistp256, ecdsa-sha2-nistp384, ecdsa-sha2-nistp521, ssh-ed25519 (also called ed25519).
#                 ensure => present
#             }
#    }  
#
class ssh_hardening (
        # parameters
        $port = 22,
        $password_auth = "no",
        $permit_root_login = "yes",
        
        $users = {},
        
        $keys = {}  
    ) {
        
        # Install/update and start the ssh-server
        class { 'ssh_hardening::update' :}
    
        # pass all the parameters into the sshd_config file
         class { 'ssh_hardening::server' : 
             settings => { 
                 'port' => $port, 
                 'password_auth' => $password_auth,
                 'permit_root_login' => $permit_root_login
             }
         }
        
        # add all the users and keys specified
        class { 'ssh_hardening::usermanagement' :
            users => $users,
            keys => $keys
        }
}