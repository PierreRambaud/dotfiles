# -*- coding: utf-8 -*-

node.default['pyenv']['user_installs'] = [
  {
    'user'     => node['dotfiles']['user'],
    'pythons'  => ['2.7.12', '3.5.2'],
    'global'   => '3.5.2'
  }
]

include_recipe 'pyenv::user'
