['bash_aliases', 'bashrc', 'config/terminator/config'].each do |item|
  template item do
    source "#{item}.erb"
    path "#{node['dotfiles']['home_dir']}/.#{item}"
    owner node['dotfiles']['user']
    group node['dotfiles']['user']
    action :create
  end
end

directory 'terminator' do
  path "#{node['dotfiles']['home_dir']}/.config/terminator"
  owner node['dotfiles']['user']
  group node['dotfiles']['user']
  recursive true
  action :create
end

['gitconfig', 'gitignore', 'conkyrc', 'fluxbox'].each do |item|
  cookbook_file item do
    source item
    path "#{node['dotfiles']['home_dir']}/.#{item}"
    owner node['dotfiles']['user']
    group node['dotfiles']['user']
    action :create
  end
end

['computer', 'general', 'network', 'system'].each do |item|
  template "conkyrc/#{item}" do
    source "conkyrc/#{item}.erb"
    path "#{node['dotfiles']['home_dir']}/.conkyrc/.#{item}"
    owner node['dotfiles']['user']
    group node['dotfiles']['user']
    action :create
  end
end

template 'fluxbox/init' do
  source 'fluxbox/init.erb'
  path "#{node['dotfiles']['home_dir']}/.fluxbox/init"
  owner node['dotfiles']['user']
  group node['dotfiles']['user']
  action :create
end

execute 'restart-fluxbox' do
  command 'fluxbox-remote "Restart"',
  path ['/usr/bin']
  action :run
end
