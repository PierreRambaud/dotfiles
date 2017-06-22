# -*- coding: utf-8 -*-

%w[bash_aliases bash_colors bashrc xscreensaver].each do |item|
  cookbook_file item do
    source item
    path "#{node['dotfiles']['user_home']}/.#{item}"
    owner node['dotfiles']['user']
    group node['dotfiles']['user']
    action :create
  end
end

directory 'terminator' do
  path "#{node['dotfiles']['user_home']}/.config/terminator"
  owner node['dotfiles']['user']
  group node['dotfiles']['user']
  recursive true
  action :create
end

%w[conkyrc fluxbox].each do |item|
  remote_directory item do
    path "#{node['dotfiles']['user_home']}/.#{item}"
    source item
    owner node['dotfiles']['user']
    group node['dotfiles']['user']
  end
end

file "#{node['dotfiles']['user_home']}/.fluxbox/scripts/move-window.py" do
  owner node['dotfiles']['user']
  group node['dotfiles']['user']
  mode '0755'
end

%w[gitconfig gitignore].each do |item|
  cookbook_file item do
    source item
    path "#{node['dotfiles']['user_home']}/.#{item}"
    owner node['dotfiles']['user']
    group node['dotfiles']['user']
    action :create
  end
end

%w[conkyrc/got config/terminator/config fluxbox/init].each do |item|
  template item do
    source "#{item}.erb"
    path "#{node['dotfiles']['user_home']}/.#{item}"
    owner node['dotfiles']['user']
    group node['dotfiles']['user']
    action :create
  end
end
