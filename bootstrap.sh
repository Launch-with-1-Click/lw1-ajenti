#/usr/bin/env bash

set -ex

# disable apparmor
sudo /etc/init.d/apparmor stop
sudo /etc/init.d/apparmor teardown
sudo update-rc.d -f apparmor remove
sudo apt-get remove apparmor apparmor-utils -y

sudo apt-get -y update
sudo DEBIAN_FRONTEND=noninteractive apt-get -y -o Dpkg::Options::="--force-confnew" -o Dpkg::Options::="--force-confdef" upgrade
sudo DEBIAN_FRONTEND=noninteractive apt-get -y -o Dpkg::Options::="--force-confnew" --force-yes -fuy dist-upgrade
sudo apt-get -y update
sudo apt-get -y install git unattended-upgrades fail2ban

sudo mkdir -p /etc/chef/ohai/hints/
sudo touch /etc/chef/ohai/hints/ec2.json
echo '{}' > ./ec2.json
sudo mv ./ec2.json /etc/chef/ohai/hints/ec2.json
exit 0
