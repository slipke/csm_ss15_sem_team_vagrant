class tomcat-config {
	$managementRole = "manager-gui"
	$managementUser = "ManTomcat"
	$managementPW = "PwTomcat"
	$jmxRole = "manager-gui"
	$jmxUser = "ManTomcat"
	$jmxPW = "PwTomcat"

	file { "tomcat-users":
	    owner => 'tomcat',
	    path => '/opt/apache-tomcat/conf/tomcat-users.xml',
	    content => template('tomcat-config/tomcat-users.xml.erb')
	  }	
}

