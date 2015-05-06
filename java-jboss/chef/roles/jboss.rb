name "jboss"
description "JBoss install"
run_list [
    "recipe[apt]",
    #{}"recipe[ark]",
    "recipe[java]",
    "recipe[jboss7]",
    "recipe[HdM-Jboss-chef::jboss-config]",
    ]


