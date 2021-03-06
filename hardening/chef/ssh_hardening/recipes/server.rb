# encoding: utf-8
#
# Cookbook Name:: ssh_hardening
# Recipe:: server
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

#install openssh-server
package 'openssh-server' do
	action [:install]
end

#start openssh-service
service 'ssh' do
	action [:enable, :start]
end

#set ssh port
template '/etc/ssh/sshd_conf' do
	source 'sshd_config.erb'
	owner 'root' 
	group 'root'
	mode '600'
	notifies :restart, resources(:service => "ssh")
end
