#
# Cookbook Name:: ssh_hardening
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

#include_recipe "users"
include_recipe "ssh_hardening::server"
