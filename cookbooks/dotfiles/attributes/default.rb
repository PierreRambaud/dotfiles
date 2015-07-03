# -*- coding: utf-8 -*-

override['emacs24']['version'] = '24.3'
default['apt']['compile_time_update'] = true

default['dotfiles']['user'] = 'got'
default['dotfiles']['user_home'] = "/home/#{node['dotfiles']['user']}"
default['dotfiles']['packages'] = %w(
  tmux
  zsh
  texinfo
  libx11-dev
  libxpm-dev
  libjpeg-dev
  libpng-dev
  libgif-dev
  libtiff-dev
  libgtk2.0-dev
  libncurses-dev
  terminator
  fluxbox
  xscreensaver
  conky-all
  xdotool
  libbz2-dev
  libsqlite3-dev
  wget
  llvm
  apache2
  postgresql
  htop
  xinput
  ruby
  ruby-dev
)
default['dotfiles']['gem_packages'] = %w(volay)

default['dotfiles']['theme'] = 'GotRedBlack'
default['dotfiles']['theme_color'] = 'D00402' if node['dotfiles']['theme'] == 'GotRedBlack'
default['dotfiles']['theme_color'] = '1B5B74' if node['dotfiles']['theme'] == 'GotBlueBlack'
default['dotfiles']['theme_color'] = 'FFFFFF' if node['dotfiles']['theme'] == 'GotWhiteBlack'

default['dotfiles']['theme_fg_color'] = 'FFFFFF' if node['dotfiles']['theme'] == 'GotRedBlack'
default['dotfiles']['theme_fg_color'] = 'FFFFFF' if node['dotfiles']['theme'] == 'GotBlueBlack'
default['dotfiles']['theme_fg_color'] = '000000' if node['dotfiles']['theme'] == 'GotWhiteBlack'
