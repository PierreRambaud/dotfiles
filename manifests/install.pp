# == Class dotfiles::install
#
class dotfiles::install {
  include dotfiles::params
  include dotfiles::install::tools

  user {$dotfiles::params::user_name:
    ensure     => present,
    managehome => true,
  }
}
