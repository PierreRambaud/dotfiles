# frozen_string_literal: true

node.default['ndenv']['user'] = node['dotfiles']['user']
node.default['ndenv']['user_home'] = node['dotfiles']['user_home']
node.default['ndenv']['installs'] = %w[v8.6.0]
node.default['ndenv']['global'] = 'v8.6.0'

include_recipe 'ndenv'
include_recipe 'ndenv::install'
