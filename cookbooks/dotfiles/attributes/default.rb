# frozen_string_literal: true

default['apt']['compile_time_update'] = true
default['pyenv']['git_ref'] = 'master'

default['dotfiles']['user'] = 'got'
default['dotfiles']['user_home'] = "/home/#{node['dotfiles']['user']}"
default['dotfiles']['packages'] = %w[
  apache2
  build-essential
  conky-all
  curl
  emacs25
  fluxbox
  arandr
  htop
  libbz2-dev
  libgif-dev
  libgtk2.0-dev
  libjpeg-dev
  libncurses-dev
  libncurses5-dev
  libncursesw5-dev
  libpng-dev
  libreadline-dev
  libsqlite3-dev
  libssl-dev
  libtiff-dev
  libx11-dev
  libxpm-dev
  llvm
  localepurge
  make
  php
  php-bz2
  php-curl
  php-gd
  php-intl
  php-mysql
  php-pdo
  php-pear
  php-pgsql
  php-xdebug
  php-xml
  pm-utils
  postgresql
  ruby
  ruby-dev
  terminator
  texinfo
  tk-dev
  tmux
  wget
  xdotool
  xinput
  xscreensaver
  xz-utils
  zlib1g-dev
  zsh
]
default['dotfiles']['gem_packages'] = %w[]

default['dotfiles']['theme'] = 'GotRedBlack'
default['dotfiles']['theme_color'] = 'D00402' if node['dotfiles']['theme'] == 'GotRedBlack'
default['dotfiles']['theme_color'] = '1B5B74' if node['dotfiles']['theme'] == 'GotBlueBlack'
default['dotfiles']['theme_color'] = 'FFFFFF' if node['dotfiles']['theme'] == 'GotWhiteBlack'

default['dotfiles']['theme_fg_color'] = 'FFFFFF' if node['dotfiles']['theme'] == 'GotRedBlack'
default['dotfiles']['theme_fg_color'] = 'FFFFFF' if node['dotfiles']['theme'] == 'GotBlueBlack'
default['dotfiles']['theme_fg_color'] = '000000' if node['dotfiles']['theme'] == 'GotWhiteBlack'
