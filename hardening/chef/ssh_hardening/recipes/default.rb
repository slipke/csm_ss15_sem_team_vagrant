# encoding: utf-8
#
# Cookbook Name:: ssh_hardening
# Recipe:: default
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

# this recipe adds users with the corresponding publickeys. If users have already been initialized, you can skip this recipe and proceed with the hardening. Please be aware of the nopassword login if no public key is set.

# update apt repos
include_recipe "apt"

include_recipe "ssh_hardening::usermanagement"

include_recipe "ssh_hardening::server"
