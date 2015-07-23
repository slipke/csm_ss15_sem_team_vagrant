Exec { path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ] }
exec { 'apt-get update':
  path => '/usr/bin',
}
exec { 'sudo apt-get install unzip':
  path => '/usr/bin',
}

include java
class { 'jboss':
  install             => 'source',
  version             => '7',
}

include 'jboss-config'

 
