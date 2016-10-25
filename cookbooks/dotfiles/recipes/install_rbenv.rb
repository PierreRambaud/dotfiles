# -*- coding: utf-8 -*-

node.default['rbenv']['user'] = node['dotfiles']['user']
node.default['rbenv']['group'] = node['dotfiles']['user']
node.default['rbenv']['user_home'] = node['dotfiles']['user_home']
node.default['rbenv']['root_path'] = "#{node['dotfiles']['user_home']}/.rbenv"

include_recipe 'rbenv'
include_recipe 'rbenv::ruby_build'
