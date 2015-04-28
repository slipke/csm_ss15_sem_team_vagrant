# encoding: utf-8
#
# Cookbook Name:: mysql_hardening
# Recipe:: mysql_hardening
#
# Copyright 2015, Steffen Hinderer, Hochschule der Medien Stuttgart
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# run script with parameters
# TODO

# Parameters: root-password, change root-password, new-password, new-password-repeat, remove anonymous user, dissallow root login, remove test database, reload privileges 
# do two different script, one with the password change and one without (skip the pw and pw repeat)

#`echo -e "\npasswd \ny \ny \nabc \nabc \ny \ny \ny \ny" | mysql_secure_installation`     

puts node['mysql']['new_root_password']
           
# if node['mysql']['change_root_password'] == "y" 
#   `echo -e "\n#{node['mysql']['root_password']} \n#{node['mysql']['change_root_password']} \ny \n#{node['mysql']['new_root_password']} \n#{node['mysql']['new_root_password']} \n#{node['mysql']['remove_anonmymous_user']} \n#{node['mysql']['disallow_root_login']} \n#{node['mysql']['remove_test_database'] } \ny" | mysql_secure_installation`
# else
#                      
# end 


# Make sure that NOBODY can access the server without a password
mysql -e "UPDATE mysql.user SET Password = PASSWORD('abc') WHERE User = 'root'"
# Kill the anonymous users
mysql -e "DROP USER ''@'localhost'"
# Because our hostname varies we'll use some Bash magic here.
mysql -e "DROP USER ''@'$(hostname)'"
# Kill off the demo database
mysql -e "DROP DATABASE test"
# Make our changes take effect
mysql -e "FLUSH PRIVILEGES"
# Any subsequent tries to run queries this way will get access denied because lack of usr/pwd param



