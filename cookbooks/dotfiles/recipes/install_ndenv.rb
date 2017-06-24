# -*- coding: utf-8 -*-

node.default['ndenv']['user'] = node['dotfiles']['user']
node.default['ndenv']['user_home'] = node['dotfiles']['user_home']
node.default['ndenv']['installs'] = %w[v8.1.2]
node.default['ndenv']['global'] = 'v8.1.2'

include_recipe 'ndenv'
include_recipe 'ndenv::install'
