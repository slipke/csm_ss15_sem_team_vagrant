class jboss-config {

$ajp_port = 8009
$http_port = 8081
$https_port= 8443
$public_bind_add= '0.0.0.0'
$mgmt_bind_addr = '0.0.0.0'
$unsecure_bind_addr = '0.0.0.0'
$admin_user = 'Administrator'
$admin_pass = 'eca67a3c9e0186b165aa4af13576de7a'

file { "standalone.xml":
    owner => 'jboss',
    path => '/opt/jboss/standalone/configuration/standalone.xml',
    content => template('jboss-config/standalone.xml.erb'),
    require => Class['jboss::install']
  }	
 file { "mgmt-users.properties":
    owner => 'jboss',
    path => '/opt/jboss/standalone/configuration/mgmt-users.properties',
    content => template('jboss-config/mgmt-users.properties.erb'),
    require => Class['jboss::install']
  }

file { "Final/standalone.xml":
    owner => 'jboss',
    path => '/opt/jboss-as-7.1.1.Final/standalone/configuration/standalone.xml',
    content => template('jboss-config/standalone.xml.erb'),
    require => Class['jboss::install']
  }	
 file { "Final/mgmt-users.properties":
    owner => 'jboss',
    path => '/opt/jboss-as-7.1.1.Final/standalone/configuration/mgmt-users.properties',
    content => template('jboss-config/mgmt-users.properties.erb'),
    require => Class['jboss::install']
  }	

}

