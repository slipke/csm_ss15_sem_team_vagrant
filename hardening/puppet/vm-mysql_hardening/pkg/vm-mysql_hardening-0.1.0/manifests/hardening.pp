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
# == Class: mysql_hardening::hardening
#
# Runs mysql shell scripts according to the settings
#
class mysql_hardening::hardening  (
    $change_mysql_pw,
    $mysql_root_pw, 
    $new_mysql_root_pw, 
    $remove_anonymous_user, 
    $deactivate_remote_host, 
    $delete_demo_database 
    ) inherits mysql_hardening {
    
    $path = "/usr/:/bin/:/sbin/:/usr/sbin:/usr/bin/"   
        
    ##
    # change root password
    ##
    if ($change_mysql_pw == true) {     
        if ($mysql_root_pw != "") {      
            exec { "changeMySqlRootPw":
                command => "mysql -u root -p$mysql_root_pw -e \"UPDATE mysql.user SET Password = PASSWORD('$new_mysql_root_pw');\"",
                path => $path
            }
        } else {
            exec { "changeMySqlRootPw":
                command => "mysql -u root -e \"UPDATE mysql.user SET Password = PASSWORD('$new_mysql_root_pw');\"",
                path => $path
            }
        }
    }
    
    ##
    # remove anonymous user
    #

    if ($mysql_root_pw != "") and ($remove_anonymous_user == true) {      
        exec { "removeAnonymousUser":
            command => "mysql -u root -p$mysql_root_pw -e \"DELETE FROM mysql.user WHERE User='';\"",
            path => $path
        }
    } if ($mysql_root_pw == "") and ($remove_anonymous_user == true) {
        exec { "removeAnonymousUser":
            command => "mysql -u root -e \"DELETE FROM mysql.user WHERE User='';\"",
            path => $path
        }
    }
    
    
    ##
    # deavtivate remote host
    ##
    
    if ($mysql_root_pw != "") and ($deactivate_remote_host == true) {      
        exec { "deactivateRemoteHost":
            command => "mysql -u root -p$mysql_root_pw -e \"DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');\"",
            path => $path
        }
    } if ($mysql_root_pw == "") and ($deactivate_remote_host == true) {
        exec { "deactivateRemoteHost":
            command => "mysql -u root -e \"DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');\"",
            path => $path
        }
    }
    
    ##
    # delete demo database
    ##
    
    if ($mysql_root_pw != "") and ($delete_demo_database == true) {      
        exec { "deleteDemoDatabase":
            command => "mysql -u root -p$mysql_root_pw -e \"DROP DATABASE test;\"",
            path => $path
        }
    } if ($mysql_root_pw == "") and ($delete_demo_database == true) {
        exec { "deleteDemoDatabase":
            command => "mysql -u root -e \"DROP DATABASE test;\"",
            path => $path
        }
    }
    
    
    ##
    # flush PRIVILEGES
    ##
    if ($mysql_root_pw != "") {      
        exec { "flushPrivileges":
            command => "mysql -u root -p$mysql_root_pw -e \"FLUSH PRIVILEGES;\"",
            path => $path
        }
    } else {
        exec { "flushPrivileges":
            command => "mysql -u root -e \"FLUSH PRIVILEGES;\"",
            path => $path
        }
    }
}