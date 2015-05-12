node default {
    $path = "/usr/:/bin/:/sbin/:/usr/sbin:/usr/bin/" 

    ##
    # make sure mysql-server is installed and running
    ##
    
    package { mysql-server:
            ensure => "installed"
        }
        
    service { mysql-server:
            ensure => "running"
    }    
        
    ##
    # change root password
    ##
    
    $mySqlRootPw = "asdf"
    $newMySqlRootPw = "asdf"
    
    if ($mySqlRootPw != "") {      
        exec { "changeMySqlRootPw":
            command => "mysql -u root -p$mySqlRootPw -e \"UPDATE mysql.user SET Password = PASSWORD('$newMySqlRootPw');\"",
            path => $path
        }
    } else {
        exec { "changeMySqlRootPw":
            command => "mysql -u root -e \"UPDATE mysql.user SET Password = PASSWORD('$newMySqlRootPw');\"",
            path => $path
        }
    }
    
    ##
    # remove anonymous user
    #
    
    $removeAnonymousUser = true
    
    
    if ($mySqlRootPw != "") and ($removeAnonymousUser == true) {      
        exec { "removeAnonymousUser":
            command => "mysql -u root -p$mySqlRootPw -e \"DELETE FROM mysql.user WHERE User='';\"",
            path => $path
        }
    } if ($mySqlRootPw == "") and ($removeAnonymousUser == true) {
        exec { "removeAnonymousUser":
            command => "mysql -u root -e \"DELETE FROM mysql.user WHERE User='';\"",
            path => $path
        }
    }
    
    
    ##
    # deavtivate remote host
    ##
    
    $deactivateRemoteHost = true
    
    if ($mySqlRootPw != "") and ($deactivateRemoteHost == true) {      
        exec { "deactivateRemoteHost":
            command => "mysql -u root -p$mySqlRootPw -e \"DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');\"",
            path => $path
        }
    } if ($mySqlRootPw == "") and ($deactivateRemoteHost == true) {
        exec { "deactivateRemoteHost":
            command => "mysql -u root -e \"DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');\"",
            path => $path
        }
    }
    
    ##
    # delete demo database
    ##
        
    $deleteDemoDatabase = true
    

    if ($mySqlRootPw != "") and ($deleteDemoDatabase == true) {      
        exec { "deleteDemoDatabase":
            command => "mysql -u root -p$mySqlRootPw -e \"DROP DATABASE test;\"",
            path => $path
        }
    } if ($mySqlRootPw == "") and ($deleteDemoDatabase == true) {
        exec { "deleteDemoDatabase":
            command => "mysql -u root -e \"DROP DATABASE test;\"",
            path => $path
        }
    }
    
    
    ##
    # flush PRIVILEGES
    ##
    if ($mySqlRootPw != "") {      
        exec { "flushPrivileges":
            command => "mysql -u root -p$mySqlRootPw -e \"FLUSH PRIVILEGES;\"",
            path => $path
        }
    } else {
        exec { "flushPrivileges":
            command => "mysql -u root -e \"FLUSH PRIVILEGES;\"",
            path => $path
        }
    }
      
}