# frozen_string_literal: true

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

%w[fluxbox].each do |item|
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

directory 'conkyrc' do
  path "#{node['dotfiles']['user_home']}/.conkyrc"
  owner node['dotfiles']['user']
  group node['dotfiles']['user']
  recursive true
  action :create
end

%w[conkyrc/got conkyrc/rings-v1.2.1.lua_dark config/terminator/config fluxbox/init].each do |item|
  template item do
    source "#{item}.erb"
    path "#{node['dotfiles']['user_home']}/.#{item}"
    owner node['dotfiles']['user']
    group node['dotfiles']['user']
    action :create
  end
end
