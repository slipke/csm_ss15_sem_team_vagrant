Exec { path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ] }
exec { 'apt-get update':
  path => '/usr/bin',
}

#include apt
/*class { 'apt':
  update => {
    frequency => 'daily',
  },
}*/

include java

class { 'tomcat': }
tomcat::instance { 'test':
  source_url => 'http://mirror.23media.de/apache/tomcat/tomcat-6/v6.0.43/bin/apache-tomcat-6.0.43.tar.gz'
}->
tomcat::service { 'default': }



include tomcat-config
 