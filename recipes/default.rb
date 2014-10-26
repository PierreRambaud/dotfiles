# encoding: UTF-8
# coding: UTF-8
# -*- coding: UTF-8 -*-

include_recipe 'apt'
resources('package[update-notifier-common]').instance_exec do
  action :nothing
end

include_recipe 'dotfiles::install'
include_recipe 'emacs24'
include_recipe 'dotfiles::config'
include_recipe 'dotfiles::service'
