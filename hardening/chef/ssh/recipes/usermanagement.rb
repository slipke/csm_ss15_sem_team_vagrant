# encoding: utf-8
#
# Cookbook Name:: ssh_hardening
# Recipe:: usermanagement
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

#iterate through the user hash (/attributes/default.rb) and creates user accounts with a home directory.
i = 0
while node['user'].size > i do
  
  #create groups if it doesnt exist
  group "#{node['user'][i]['name']}" do
    action :create
  end

  #hash the password for useradd and remove unix line ending
  password = `openssl passwd -1 #{node['user'][i]['password']}`
  password = password.chomp

  if node['user'][i]['system'] == 'false'
      #create user, add to sudo group if wanted
      user "#{node['user'][i]['name']}" do
	supports :manage_home => true
	home "/home/#{node['user'][i]['name']}"
	gid "#{node['user'][i]['name']}"
	comment 'created by chef'
	password "#{password}"
	shell '/bin/bash'
	action :create
      end
      
      #create the ssh directory in the user folder
      directory "/home/#{node['user'][i]['name']}/.ssh" do
	owner "#{node['user'][i]['name']}"
	group "#{node['user'][i]['name']}"
	mode '0700'
	action :create
      end

      #write keys to template and copy to the .ssh user folder
      template "/home/#{node['user'][i]['name']}/.ssh/authorized_keys" do
	source 'authorized_keys.erb'
	owner "#{node['user'][i]['name']}" 
	group "#{node['user'][i]['name']}"
	mode '600'
	variables({
	  :sshPublicKeys => node['user'][i][:publicKey]
	})
      end
  else 
      #create user, add to sudo group if wanted
      user "#{node['user'][i]['name']}" do
	system true
	comment 'created by chef'
	shell '/bin/bash'
	action :create
      end
    
  end
  
  i += 1
end 