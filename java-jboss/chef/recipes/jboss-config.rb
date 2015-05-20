template "jbossmgmt-users.properties." do
  Chef::Log.info "Add user with Config template"
  path "/opt/jboss/standalone/configuration/mgmt-users.properties"
  source "jboss.mgmt-users.properties.erb"
  owner "web"
  group "web"
  mode "0644"
  notifies :enable, 'service[jboss]', :delayed
  notifies :restart, 'service[jboss]', :delayed
end

execute "start jboss server manually" do
  command "sudo /opt/jboss/bin/standalone.sh"
  action :run
end
