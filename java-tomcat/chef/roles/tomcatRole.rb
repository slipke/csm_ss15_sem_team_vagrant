name "tomcatRole"
description "Baseline configuration for all systems."
 
run_list(
	'recipe[apt::default]',
    'recipe[java::default]',
    'recipe[tomcat::default]',
    'recipe[tomcat::users]'
	)