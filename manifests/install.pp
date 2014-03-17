# == Class dotfiles::install
#
class dotfiles::install {
  include dotfiles::params

  user {$dotfiles::params::user_name:
    ensure     => present,
    managehome => true,
    shell      => '/bin/bash',
  } ->

  class {'dotfiles::install::tools': } ->
  class {'dotfiles::install::rbenv': } ->
  class {'dotfiles::install::pyenv': }
}
