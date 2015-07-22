#
# Cookbook Name:: ruby_on_rails
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe "apt"
include_recipe 'ruby'

package "make" do

	action :install
end	

package "zlib1g-dev" do
	action :install
end	

package "patch" do
	action :install
end	

package "sqlite3" do
	action :install
end	

package "libsqlite3-dev" do
	action :install
end	

package "nodejs" do
	action :install
end	

directory node['ror']['server_dir'] do
	recursive true
	action :delete
end	

directory node['ror']['server_dir'] do
	action :create
end	


execute 'install_rails' do
	command 'gem install rails --no-ri --no-rdoc'
end

log 'message' do
  message 'The Server is running on Port 3000'
  level :info
end



execute 'install_sqlite' do
	command 'gem install sqlite3 --no-ri --no-rdoc'
end

execute 'create_new_ror_app' do
	command "rails new #{node['ror']['server_dir']}"
end	

execute 'start_ror_server' do
	cwd node['ror']['server_dir']
	command 'rails server -d'
end