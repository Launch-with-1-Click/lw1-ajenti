local_mode true
chef_repo_path File.dirname(__FILE__)
cookbook_path [
  File.expand_path("../cookbooks", __FILE__),
  File.expand_path("../site-cookbooks", __FILE__)
]

knife[:ssh_user]       = "ubuntu"
knife[:identity_file]  = ENV['AWS_EC2_KEYPASS']
knife[:ssh_attribute]  = "knife_zero.host"
