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

## Tempolary SSLv3 disable.
cookbook_file '/etc/courier/imapd-ssl' do
  source 'imapd-ssl'
end

## Ajenti Core patch
cookbook_file '/usr/share/pyshared/ajenti/core.py' do
  source 'ajenti/core.py'
  only_if {
    require 'specinfra'
    Object.include Chef::Mixin::ShellOut
    shell_out(Specinfra::Command::Debian::Base::Package.get_version('ajenti')).stdout == "1.2.23.0"
  }
end

