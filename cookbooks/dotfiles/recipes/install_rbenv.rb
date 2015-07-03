# -*- coding: utf-8 -*-

node.default['rbenv']['user'] = node['dotfiles']['user']
node.default['rbenv']['group'] = node['dotfiles']['user']
node.default['rbenv']['user_home'] = node['dotfiles']['user_home']
node.default['rbenv']['root_path'] = "#{node['dotfiles']['user_home']}/.rbenv"

include_recipe 'rbenv'
include_recipe 'rbenv::ruby_build'

[['1.9.3-p551', false], ['2.0.0-p598', false], ['2.1.5', true]].each do |version, is_global|
  rbenv_ruby version do
    global is_global
  end

  ['bundler'].each do |pkg|
    rbenv_gem "#{pkg}-ruby-#{version}" do
      package_name pkg
      ruby_version version
    end
  end
end
