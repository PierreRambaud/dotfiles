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

include_recipe 'dotfiles::install_rbenv'
include_recipe 'dotfiles::install_ndenv'
include_recipe 'dotfiles::install_pyenv'

git 'install-emacs-configuration' do
  destination "#{node['dotfiles']['user_home']}/.emacs.d"
  repository 'https://github.com/PierreRambaud/emacs.d.git'
  user node['dotfiles']['user']
  group node['dotfiles']['user']
  timeout 9000
  action :checkout
end

cask_installer = "#{Chef::Config[:file_cache_path]}/cask-install.py"
remote_file 'download-cask-installer' do
  path cask_installer
  source 'https://raw.github.com/cask/cask/master/go'
end

execute 'install-cask' do
  command "python #{cask_installer}"
  environment 'HOME' => node['dotfiles']['user_home'], 'USER' => node['dotfiles']['user']
  only_if do
    not ::File.exist?("#{node['dotfiles']['user_home']}/.cask")
  end
  ignore_failure true
end

execute 'install-emacs-dependencies' do
  cwd "#{node['dotfiles']['user_home']}/.emacs.d"
  environment 'PATH' => "#{ENV['PATH']}:#{node['dotfiles']['user_home']}/.cask/bin"
  command 'cask install'
end
