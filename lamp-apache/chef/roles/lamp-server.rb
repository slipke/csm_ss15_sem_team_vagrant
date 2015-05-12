name "lamp-server"
description "Lamp install"
run_list [
    "recipe[apt]",
    "recipe[apache2]",
    "recipe[lampp]",
    "recipe[php]",
    ]