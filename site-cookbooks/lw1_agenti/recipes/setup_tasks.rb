chef_gem "unix-crypt"

directory "/opt/lw1/tasks" do
  action :create
  recursive true
end

cookbook_file "/opt/lw1/tasks/vh.json.erb" do
  source "ajenti/vh.json.erb"
end

template "/opt/lw1/tasks/first_boot.rb" do
  source "tasks/first_boot.erb"
end

service "ajenti" do
  action [:stop, :disable]
end

file "/etc/ajenti/ajenti.pem" do
  action :delete
end

file "/etc/ajenti/.ssl-generated" do
  action :delete
end

file "/var/lib/ajenti/installation-uid" do
  action :delete
end

cron "setup_ajenti_on_init" do
  action :create
  time :reboot
  command "/opt/chef/bin/chef-apply /opt/lw1/tasks/first_boot.rb"
end
