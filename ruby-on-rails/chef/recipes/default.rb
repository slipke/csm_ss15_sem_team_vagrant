# encoding: utf-8
#
# Cookbook Name:: ruby_on_rails
# Recipe:: default
#
#
# Copyright 2015, Sebastian Löw, Hochschule der Medien Stuttgart
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

include_recipe "apt"

##### Packages #########
package "make" do
	action :install
end	

package "zlib1g-dev" do
	action :install
end	

package "libssl-dev" do
	action :install
end	

package "libreadline-dev" do
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

package "git" do
	action :install
end	

package "curl" do
	action :install
end	

package "gcc" do
	action :install
end	

##### Rbenv #########

execute 'install rbenv' do
	command 'curl -L https://raw.github.com/fesplugas/rbenv-installer/master/bin/rbenv-installer | bash'
end

execute 'install_rbenv_env' do
	command 'eval "$(rbenv init -)"'
end 

execute 'add_com_to_env' do
	command 'echo \'export PATH="$HOME/.rbenv/bin:$PATH"\' >> ~/#{node["ror"]["bash_file"]}; echo \'eval "$(rbenv init -)"\' >> ~/#{node["ror"]["bash_file"]}'
end	

##### Ruby #########

execute 'install_ruby' do
	command "/root/.rbenv/bin/rbenv install -s #{node['ror']['ruby_version']}"
end		

execute 'ruby_version_global' do
	command "/root/.rbenv/bin/rbenv global #{node['ror']['ruby_version']}"
end	

##### Rails  #########

directory node['ror']['server_dir'] do
	recursive true
	action :delete
end	

directory node['ror']['server_dir'] do
	action :create
end	

execute 'install_rails' do
	command '/root/.rbenv/bin/rbenv exec gem install rails --no-ri --no-rdoc'
end

execute 'install_sqlite' do
	command '/root/.rbenv/bin/rbenv exec gem install sqlite3 --no-ri --no-rdoc'
end

##### Rails App #########

execute 'create_new_ror_app' do
	command "/root/.rbenv/bin/rbenv exec rails new #{node['ror']['server_dir']}"
end	

execute 'start_ror_server' do
	cwd node['ror']['server_dir']
	command '/root/.rbenv/bin/rbenv exec rails server -b0.0.0.0 -d'
end