#
# Cookbook Name:: lw1_agenti
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe "#{cookbook_name}::ajenti"
include_recipe "#{cookbook_name}::setup_tasks"
include_recipe "#{cookbook_name}::default_site"
