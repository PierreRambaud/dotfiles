# -*- coding: utf-8 -*-

%w(bash_aliases bashrc).each do |item|
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

%w(conkyrc fluxbox).each do |item|
  remote_directory item do
    path "#{node['dotfiles']['user_home']}/.#{item}"
    source item
    owner node['dotfiles']['user']
    group node['dotfiles']['user']
  end

  execute "chown-#{item}" do
    command "chown -hR #{node['dotfiles']['user']}:#{node['dotfiles']['user']} " \
    "#{node['dotfiles']['user_home']}/.#{item}"
  end
end

file "#{node['dotfiles']['user_home']}/.fluxbox/scripts/move-window.sh" do
  owner node['dotfiles']['user']
  group node['dotfiles']['user']
end

%w(gitconfig gitignore).each do |item|
  cookbook_file item do
    source item
    path "#{node['dotfiles']['user_home']}/.#{item}"
    owner node['dotfiles']['user']
    group node['dotfiles']['user']
    action :create
  end
end

%w(conkyrc/computer conkyrc/general conkyrc/network conkyrc/system config/terminator/config fluxbox/init).each do |item|
  template item do
    source "#{item}.erb"
    path "#{node['dotfiles']['user_home']}/.#{item}"
    owner node['dotfiles']['user']
    group node['dotfiles']['user']
    action :create
  end
end
