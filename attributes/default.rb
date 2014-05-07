# encoding: UTF-8
# coding: UTF-8
# -*- coding: UTF-8 -*-

default['dotfiles']['user'] = 'got'
default['dotfiles']['user_home'] = "/home/#{node['dotfiles']['user']}"
default['dotfiles']['theme'] = 'GotWhiteBlack'
default['dotfiles']['packages'] = %w(
  rake
  terminator
  fluxbox
  xscreensaver
  conky
  xdotool
  libbz2-dev
  libsqlite3-dev
  wget
  llvm
)
