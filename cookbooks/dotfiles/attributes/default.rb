# frozen_string_literal: true

default['apt']['compile_time_update'] = true
default['pyenv']['git_ref'] = 'master'

default['dotfiles']['user'] = 'got'
default['dotfiles']['user_home'] = "/home/#{node['dotfiles']['user']}"
default['dotfiles']['packages'] = %w[
  apache2
  arandr
  bash-completion
  build-essential
  conky-all
  curl
  flameshot
  fluxbox
  htop
  libbz2-dev
  libgccjit-10-dev
  libgif-dev
  libgnutls28-dev
  libgtk2.0-dev
  libjansson-dev
  libjpeg-dev
  libmagick++-dev
  libncurses-dev
  libncurses5-dev
  libncursesw5-dev
  libpng-dev
  libreadline-dev
  libsqlite3-dev
  libssl-dev
  libtiff-dev
  libtiff5-dev
  libx11-dev
  libxpm-dev
  llvm
  localepurge
  make
  pm-utils
  postgresql
  ruby
  ruby-dev
  tclxml-dev
  terminator
  texinfo
  tk-dev
  tmux
  wget
  xdotool
  xfce4
  xfce4-whiskermenu-plugin
  xinput
  xscreensaver
  xz-utils
  zlib1g-dev
  zsh
]
default['dotfiles']['gem_packages'] = %w[]

default['dotfiles']['with_battery'] = false

default['dotfiles']['theme'] = 'GotRedBlack'
default['dotfiles']['theme_color'] = 'D00402' if node['dotfiles']['theme'] == 'GotRedBlack'
default['dotfiles']['theme_color'] = '1B5B74' if node['dotfiles']['theme'] == 'GotBlueBlack'
default['dotfiles']['theme_color'] = 'FFFFFF' if node['dotfiles']['theme'] == 'GotWhiteBlack'

default['dotfiles']['theme_fg_color'] = 'FFFFFF' if node['dotfiles']['theme'] == 'GotRedBlack'
default['dotfiles']['theme_fg_color'] = 'FFFFFF' if node['dotfiles']['theme'] == 'GotBlueBlack'
default['dotfiles']['theme_fg_color'] = '000000' if node['dotfiles']['theme'] == 'GotWhiteBlack'

# Override prerequisites because of python-openssl which is no longer available on debian 11
default['pyenv']['prerequisites'] = %w(make libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev xz-utils tk-dev libffi-dev liblzma-dev git)
