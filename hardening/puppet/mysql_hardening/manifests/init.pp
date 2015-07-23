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
# == Class: mysql_hardening
#
#
# === Parameters
#
# [*change_mysql_pw*]
# change the password for the mysql root user. Options: `true`, `false` 
#
# [*mysql_root_pw*]
# Password for the mysql root user. If you install mysql through this script the root password will be blank. Options: `String`; default: blank
#
# [*new_mysql_root_pw*]
# the new password for the mysql root user. Options: `String`
#
# [*remove_anonymous_user*]
# the MySql default settings allow anonymous users (black user name) to connect to the database, true will remove this behavior. Options: `true`, `false`  
#
# [*deactivate_remote_host*]
# dissallow remote root login. Root login will only be possible from localhost. Options: `true`, `false` 
#
# [*delete_demo_database*]
# This option removes the default test database, which every user can access. Options: `true`, `false` 
#

class mysql_hardening (
    $change_mysql_pw = true,
    $mysql_root_pw = "",
    $new_mysql_root_pw = "myNewPw",
    $remove_anonymous_user = true,
    $deactivate_remote_host = true,
    $delete_demo_database = true
) {
    
    class { 'mysql_hardening::update' : } ->
    
    class { 'mysql_hardening::hardening' :
        change_mysql_pw => $change_mysql_pw,
        mysql_root_pw => $mysql_root_pw,
        new_mysql_root_pw => $new_mysql_root_pw,
        remove_anonymous_user => $remove_anonymous_user,
        deactivate_remote_host => $deactivate_remote_host,
        delete_demo_database => $delete_demo_database
    }
}
