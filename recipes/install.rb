# encoding: UTF-8
# coding: UTF-8
# -*- coding: UTF-8 -*-

node['dotfiles']['packages'].each do |item|
  package item do
    action :install
  end
end

user node['dotfiles']['user'] do
  supports manage_home: true
  home node['dotfiles']['user_home']
  shell '/bin/bash'
end

git 'install-sliim-emacs' do
  destination "#{node['dotfiles']['user_home']}/.emacs.d"
  repository 'https://github.com/Sliim/emacs.d.git'
  user node['dotfiles']['user']
  action :sync
end

git 'install-sliim-cask' do
  destination "#{node['dotfiles']['user_home']}/.emacs.d/.cask"
  repository 'https://github.com/Sliim/emacs.d-cask.git'
  user node['dotfiles']['user']
  action :sync
end

include_recipe 'dotfiles::install_rbenv'
include_recipe 'dotfiles::install_pyenv'
