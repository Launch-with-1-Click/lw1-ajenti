apt_repository 'ajenti' do
  uri          'http://repo.ajenti.org/debian'
  distribution 'main'
  components   ['main', 'ubuntu']
  key          'http://repo.ajenti.org/debian/key'
end

node[:lw1_agenti][:depends_packages].map do |pkg|
  package pkg do
    action :install
  end
end

node[:lw1_agenti][:ajenti_packages].map do |pkg|
  package pkg do
    action :install
  end
end

directory "/etc/ajenti/certs" do
  action :create
  owner "root"
  group "root"
  mode  "0755"
end
