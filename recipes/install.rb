# encoding: UTF-8
# coding: UTF-8
# -*- coding: UTF-8 -*-

node['dotfiles']['packages'].each do |item|
  package item do
    action :install
  end
end

include_recipe 'dotfiles::install_rbenv'
include_recipe 'dotfiles::install_pyenv'
