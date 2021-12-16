# frozen_string_literal: true

node['dotfiles']['packages'].each do |item|
  package item do
    action :install
  end
end

node['dotfiles']['gem_packages'].each do |item|
  gem_package item do
    ignore_failure true
    gem_binary '/usr/bin/gem'
    action :install
  end
end

user node['dotfiles']['user'] do
  home node['dotfiles']['user_home']
  shell '/bin/bash'
  manage_home true
end

sudo node['dotfiles']['user'] do
  user node['dotfiles']['user']
end

include_recipe 'dotfiles::repositories'
include_recipe 'dotfiles::install_rbenv'
include_recipe 'dotfiles::install_nodenv'
include_recipe 'dotfiles::install_pyenv'

git 'install-emacs-configuration' do
  destination "#{node['dotfiles']['user_home']}/.emacs.d"
  repository 'https://github.com/PierreRambaud/emacs.d.git'
  user node['dotfiles']['user']
  group node['dotfiles']['user']
  timeout 9000
  action :checkout
end

git 'install-cask-repository' do
  destination "#{node['dotfiles']['user_home']}/.cask"
  repository 'https://github.com/cask/cask'
  user node['dotfiles']['user']
  group node['dotfiles']['user']
  timeout 9000
  action :checkout
end

execute 'install-emacs-dependencies' do
  cwd "#{node['dotfiles']['user_home']}/.emacs.d"
  environment 'PATH' => "#{ENV['PATH']}:#{node['dotfiles']['user_home']}/.cask/bin"
  command 'cask install'
end
