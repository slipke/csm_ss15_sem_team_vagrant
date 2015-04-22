# encoding: utf-8
#
# Cookbook Name:: ssh_hardening
# Attributes:: default
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

# SSH setting section
default['ssh']['port'] 			= [4444]  # standard ssh port
default['ssh']['passwordAuth']		= ['no'] # no, yes
default['ssh']['permitRootLogin']	= ['yes'] # no, without password

# User section
# For a new user increment the hash number below. Just copy all four lines and increment the number. 
default['user'][0]['name'] 		= 'steve' # the users name
default['user'][0]['password'] 		= 'hallo' # plaintext password
default['user'][0]['publicKey'] 	= ["thisismypublickey", "thisismypublickey2"] # the plaintext password will be hashed with the openssl passwd function. leave blank if not wanted or a system user
default['user'][0]['system'] 		= 'false' # if true it creates a system user without a home directory and password

