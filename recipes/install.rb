# -*- coding: utf-8 -*-

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

include_recipe 'dotfiles::install_rbenv'
include_recipe 'dotfiles::install_pyenv'

git 'install-emacs-configuration' do
  destination "#{node['dotfiles']['user_home']}/.emacs.d"
  repository 'https://github.com/PierreRambaud/emacs.d.git'
  enable_submodules true
  user node['dotfiles']['user']
  group node['dotfiles']['user']
  timeout 9000
  action :sync
end

cask_installer = "#{Chef::Config[:file_cache_path]}/cask-install.py"
remote_file 'download-cask-installer' do
  path cask_installer
  source 'https://raw.github.com/cask/cask/master/go'
end

execute 'install-cask' do
  command "python #{cask_installer}"
  environment 'HOME' => node['dotfiles']['user_home'], 'USER' => node['dotfiles']['user']
  ignore_failure true
end

execute 'install-emacs-dependencies' do
  cwd "#{node['dotfiles']['user_home']}/.emacs.d"
  environment 'PATH' => "#{ENV['PATH']}:#{node['dotfiles']['user_home']}/.cask/bin"
  command 'cask install'
end
