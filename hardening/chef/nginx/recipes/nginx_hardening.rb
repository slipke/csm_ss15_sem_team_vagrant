# encoding: utf-8
#
# Cookbook Name:: nginx_hardening
# Recipe:: nginx_hardening
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


# get the number of cores; a good starting point is the amount of cpu cores http://nginx.org/en/docs/ngx_core_module.html#worker_processes
if node['nginx']['worker_processes'] == 'auto'
  node.default['nginx']['worker_processes'] = `grep processor /proc/cpuinfo | wc -l`.chomp
end

# get the users ressource limitations
if node['nginx']['worker_connections'] == 'auto'
  # grep * is a workaround; chef couldn't compile just "ulimit -n"
  node.default['nginx']['worker_connections'] = `grep * | ulimit -n`.chomp
end

# install / update openssl
package 'openssl' do
  action [:install, :upgrade]
end

#register nginx as a service
service "nginx" do
  supports :restart => true
  action [:enable, :start]
end 

# replace original config file with the rendered template file and restart nginx
template '/etc/nginx/nginx.conf' do
	source 'nginx.conf.erb'
	owner 'root' 
	group 'root'
	mode '600'
	notifies :restart, 'service[nginx]'
end

# replace the index.html with a blank index.html
if node['nginx']['override_default_site'] == 'true'
  file '/usr/share/nginx/html/index.html' do
	action :delete
  end
  
   file '/usr/share/nginx/html/index.html' do
 	action :create
   end
end

# remove ln from sites-enabled
if node['nginx']['disable_default_site'] == 'true'
  file '/etc/nginx/sites-enabled/default' do
	action :delete
  end
end