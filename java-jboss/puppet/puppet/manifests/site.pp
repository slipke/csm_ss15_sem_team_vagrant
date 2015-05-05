Exec { path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ] }
exec { 'apt-get update':
  path => '/usr/bin',
}
exec { 'sudo apt-get install unzip':
  path => '/usr/bin',
}


#include apt
#class { 'apt':
#  update => {
#    frequency => 'daily',
#  },
#}

include java
class { 'jboss':
  install             => 'source',
  version             => '7',
}
#jboss::instance { 'app1':
#  createuser => false, # Default user jboss is already created by jboss class
#  bindaddr    => '192.168.33.46',
#  port        => '8080',
#}
#include jboss-config
include 'jboss-config'
#include jboss_8
#jboss::instance_8 { 'instanceName':
#    environment => 'prod',
 #   ip          => '172.16.13.15',
 #   iface       => 'eth0:8',
#    mgmt_user   => "Admininistrator",
#    mgmt_passwd => "AdminPW",
#    jmx_user    => "JMXUser",
#    jmx_passwd  => "JMXPW",
#}



#include tomcat-config
 