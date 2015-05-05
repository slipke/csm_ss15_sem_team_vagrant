template "jbossmgmt-users.properties." do
  path "/opt/jboss/standalone/configuration/mgmt-users.properties"
  source "jboss.mgmt-users.properties.erb"
  #owner "web"
  #group "web"
  mode "0644"
  notifies :enable, 'service[jboss]', :delayed
  notifies :restart, 'service[jboss]', :delayed
 # notifies :restart, resources(:service => "jboss")
end

service "jboss" do
  action :start 
end