  
  
  
# Usage 
    ## Build and install module
    run as root
    puppet module build yourPath/toThe/module
    
    
    puppet module install path/to/tar.gz


    
  `class{ 'nginx_hardening': 
                worker_processes => "18"
        }`