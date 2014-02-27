# == Class dotfiles::install
#
class dotfiles::install {
  include dotfiles::params

  user {$dotfiles::params::user_name:
    ensure     => present,
    managehome => true,
  } ->

  class {'dotfiles::install::tools': }
}
