# -*- coding: utf-8 -*-

include_recipe 'apt'
resources('package[update-notifier-common]').instance_exec do
  action :nothing
end

include_recipe 'emacs24'
include_recipe 'dotfiles::install'
include_recipe 'dotfiles::config'
include_recipe 'dotfiles::service'

execute 'chown-home-directory' do
  command "chown -hR #{node['dotfiles']['user']}:#{node['dotfiles']['user']} " +
    node['dotfiles']['user_home'].to_s
end
