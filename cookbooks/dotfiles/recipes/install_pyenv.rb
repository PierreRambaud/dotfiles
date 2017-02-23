# -*- coding: utf-8 -*-

node.default['pyenv']['user_installs'] = [
  {
    'user'     => node['dotfiles']['user'],
    'pythons'  => ['2.7.12', '3.5.2'],
    'global'   => '3.5.2'
  }
]

include_recipe 'pyenv::user'

git 'install-pyenv-virtual-env' do
  destination "#{node['dotfiles']['user_home']}/plugins/pyenv-virtualenv"
  repository 'https://github.com/yyuu/pyenv-virtualenv.git'
  user node['dotfiles']['user']
  group node['dotfiles']['user']
  timeout 9000
  action :sync
end
