# == Class dotfiles::install
#
class dotfiles::install {
  include dotfiles::params
  include dotfiles::install::tools
  include dotfiles::install::fluxbox
  include dotfiles::install::conky
  include dotfiles::install::git
  include dotfiles::install::bash

  user {$dotfiles::params::user_name:
    ensure     => present,
    managehome => true,
    password   => $dotfiles::params::user_password,
  }
}
