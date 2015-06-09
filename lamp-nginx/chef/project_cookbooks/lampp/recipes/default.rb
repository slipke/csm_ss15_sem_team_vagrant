#
# Cookbook Name:: lampp
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
mysql_service 'foo' do
  port '3306'
  version '5.5'
  initial_root_password 'change_me'
  action [:create, :start]
end