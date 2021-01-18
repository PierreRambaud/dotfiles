# frozen_string_literal: true

include_recipe 'apt'

include_recipe 'dotfiles::install'
include_recipe 'dotfiles::repositories'
include_recipe 'dotfiles::config'
include_recipe 'dotfiles::service'

execute 'chown-home-directory' do
  command("chown -hR #{node['dotfiles']['user']}:#{node['dotfiles']['user']} " +
          node['dotfiles']['user_home'].to_s)
end
