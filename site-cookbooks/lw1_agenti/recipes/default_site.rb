directory "/srv/default" do
  action :create
  owner "www-data"
  group "www-data"
  mode  "0755"
end

execut "cp -p /usr/share/nginx/html/* /srv/default/" do
  action :nothing
  subscribes :run, "directory[/srv/default]"
end


ark "phpmyadmin" do
  url node[:lw1_agenti][:bonus][:phpmyadmin][:download_url]
  version node[:lw1_agenti][:bonus][:phpmyadmin][:version]
  path "/srv/default"
  checksum  node[:lw1_agenti][:bonus][:phpmyadmin][:checksum]
  owner 'www-data'
  action :put
end

%w{
php5-mysql
}.map do |pkg|
  package pkg
end

