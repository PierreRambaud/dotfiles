# frozen_string_literal: true

node.default['ndenv']['group_users'] = [node['dotfiles']['user']]
node.default['ndenv']['user_home'] = node['dotfiles']['user_home']
node.default['ndenv']['installs'] = %w[v8.11.1 v10.1.0 v9.11.1]
node.default['ndenv']['global'] = 'v8.11.1'

include_recipe 'ndenv'
include_recipe 'ndenv::install'
