# -*- mode: ruby -*-
# vi: set ft=ruby :
require 'json'

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "dummy"
  config.omnibus.chef_version = :latest

  config.vm.synced_folder ".", "/vagrant", type: "rsync",
    rsync__exclude: [
      '.vagrant/',
      '.git/',
      'tmp/',
      'packer_cache/',
      'vendor/'
  ]

  ## AWS
  config.vm.provider :aws do |aws, override|
    aws.access_key_id = ENV['AWS_ACCESS_KEY']
    aws.secret_access_key = ENV['AWS_SECRET_ACCESS_KEY']
    aws.keypair_name = ENV['AWS_EC2_KEYPAIR']
#    aws.user_data = "#!/bin/bash\nsed -i -e 's/^Defaults.*requiretty/# Defaults requiretty/g' /etc/sudoers"

    aws.region = ENV['AWS_REGION']
    aws.instance_type = 'c3.large'
    case ENV['AWS_REGION']
    when 'ap-northeast-1'
      aws.ami = 'ami-936d9d93' # Ubuntu Server 14.04 LTS (HVM), SSD Volume Type
    when 'us-east-1'
      aws.ami = 'ami-d05e75b8' # Ubuntu Server 14.04 LTS (HVM), SSD Volume Type
    else
      raise "Unsupported region #{ENV['AWS_REGION']}"
    end

    aws.tags = {
      'Name' => 'Ajenti 1.x + Agenti-V (Develop)'
    }
    override.ssh.username = "ubuntu"
    override.ssh.private_key_path = ENV['AWS_EC2_KEYPASS']
  end

  config.ssh.pty = true

  ## Sction Provisioning
  config.vm.provision :shell, :path => "bootstrap.sh"
  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = ["cookbooks", "site-cookbooks"]
    chef.roles_path      = "roles"
    chef.add_recipe "role[provision-ubuntu]"
  end

end
