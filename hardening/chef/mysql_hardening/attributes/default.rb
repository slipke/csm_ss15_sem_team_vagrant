# encoding: utf-8
#
# Cookbook Name:: mysql_hardening
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

# Parameters: root-password, change root-password, new-password, new-password-repeat, remove anonymous user, dissallow root login, remove test database

# hardening setting and basic optimization
default['mysql']['change_root_password'] 			= true  		# options: true, false; 
default['mysql']['root_password'] 					= ''  			# options: String; default: blank
default['mysql']['new_root_password'] 				= 'topSecret' 	# options: String
default['mysql']['remove_anonmymous_user'] 			= true  		# options: true, false; 
default['mysql']['disallow_root_login'] 			= true  		# options: true, false; 
default['mysql']['remove_test_database'] 			= true 			# options: true, false;  



