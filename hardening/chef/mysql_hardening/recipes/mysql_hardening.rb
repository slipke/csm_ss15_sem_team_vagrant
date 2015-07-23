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

# this script runs the same actions as the "mysql_secure_installation" script

# change the root password (default pw after fresh installation is empty)
if node['mysql']['change_root_password'] == true
    if node['mysql']['root_password'] == ''
        result = `mysql -u root -e "UPDATE mysql.user SET Password = PASSWORD('#{node['mysql']['new_root_password']}') WHERE User = 'root';" 2>&1`
    else    
        result = `mysql -u root -p#{node['mysql']['root_password']} -e "UPDATE mysql.user SET Password = PASSWORD('#{node['mysql']['new_root_password']}') WHERE User = 'root';" 2>&1`
    end
  if result != ''
      log "mysql_hardening" do
      message "could not change mysql root password - MySql error message: "+result
      level :warn
    end
  end 
end

# remove anonymous user
if node['mysql']['remove_anonmymous_user'] == true
    if node['mysql']['root_password'] == ''
        result = `mysql -u root -e "DELETE FROM mysql.user WHERE User='';" 2>&1`
    else    
        result = `mysql -u root -p#{node['mysql']['root_password']} -e "DELETE FROM mysql.user WHERE User='';" 2>&1`
    end
     if result != ''
      log "mysql_hardening" do
      message "could not remove anonymous user - MySql error message: "+result
      level :warn
    end
  end 
end
 
# deactivate remote root 
if node['mysql']['disallow_root_login'] == true
    if node['mysql']['root_password'] == ''
        result = `mysql -u root -e "DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');" 2>&1`
    else    
        result = `mysql -u root -p#{node['mysql']['root_password']} -e "DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');" 2>&1`
    end
  if result != ''
      log "mysql_hardening" do
      message "could not deactivate remote root - MySql error message: "+result
      level :warn
    end
  end  
end 

# delete the demo database
if node['mysql']['remove_test_database'] == true
  # redirect from stderr 2 stdout
    if node['mysql']['root_password'] == ''
        result =`mysql -u root -e "DROP DATABASE test;" 2>&1`
    else
        result =`mysql -u root -p#{node['mysql']['root_password']} -e "DROP DATABASE test;" 2>&1`
    end
    if result != ''
      log "mysql_hardening" do
      message "could not remove demo database - MySql error message: "+result
      level :warn
    end
  end  
end

 # flush privileges to apply all the changes
if node['mysql']['root_password'] == ''
    result = `mysql -u root -e "FLUSH PRIVILEGES;" 2>&1`
else
    result = `mysql -u root -p#{node['mysql']['root_password']} -e "FLUSH PRIVILEGES;" 2>&1`
end
  if result != ''
    log "mysql_hardening" do
    message "could not flush privileges - MySql error message: "+result
    level :warn
  end
end  