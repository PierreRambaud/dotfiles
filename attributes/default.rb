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

default['dotfiles']['theme_color'] = 'D00402' if node['dotfiles']['theme'] == 'GotRedBlack'
default['dotfiles']['theme_color'] = '1B5B74' if node['dotfiles']['theme'] == 'GotBlueBlack'
default['dotfiles']['theme_color'] = 'FFFFFF' if node['dotfiles']['theme'] == 'GotWhiteBlack'

default['dotfiles']['theme_fg_color'] = 'FFFFFF' if node['dotfiles']['theme'] == 'GotRedBlack'
default['dotfiles']['theme_fg_color'] = 'FFFFFF' if node['dotfiles']['theme'] == 'GotBlueBlack'
default['dotfiles']['theme_fg_color'] = '000000' if node['dotfiles']['theme'] == 'GotWhiteBlack'
