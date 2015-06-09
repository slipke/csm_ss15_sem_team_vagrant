name "lamp-server"
description "Lamp install"
run_list [
    "recipe[apt]",
    "recipe[nginx]",
    "recipe[lampp]",
    #{}"recipe[lampp::firewall]"
    "recipe[php]",
    ]