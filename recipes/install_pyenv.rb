# encoding: UTF-8
# coding: UTF-8
# -*- coding: UTF-8 -*-

node.default['pyenv']['user_installs'] = [
  {
    'user'     => node['dotfiles']['user'],
    'pythons'  => ['2.7.6', '3.3.2'],
    'global'   => '3.3.2'
  }
]

include_recipe 'pyenv::user'
