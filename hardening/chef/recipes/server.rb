#
# Cookbook Name:: ssh_hardening
# Recipe:: server
#
# Copyright (c) 2015 Steffen Hinderer Hochschule der Medien Stuttgart, All Rights Reserved.

#install openssh-server
package 'openssh-server' do
	action [:install]
end

#start openssh-service
service 'ssh' do
	action [:enable, :start]
end

#create .ssh directory for logged in user and copy the authorized_key file
#TODO change to ~/.ssh
#TODO parse the keyfiles and write them in authorized_key file
#remote_directory '/home/'+node['current_user']+'/.ssh' do
#	source 'ssh_keys'
#	notifies :restart, resources(:service => "ssh")
#end

#set ssh port
template '/etc/ssh/sshd_conf' do
	source 'sshd_config.erb'
	owner 'root' 
	group 'root'
	mode '600'
	notifies :restart, resources(:service => "ssh")
end
