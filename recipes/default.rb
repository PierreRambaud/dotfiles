# encoding: UTF-8
# coding: UTF-8
# -*- coding: UTF-8 -*-

include_recipe 'apt'
include_recipe 'dotfiles::install'
include_recipe 'dotfiles::config'
include_recipe 'dotfiles::service'
