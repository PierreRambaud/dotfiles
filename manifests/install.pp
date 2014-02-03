# == Class dotfiles::install
#
class dotfiles::install {
  include dotfiles::params

  install_package { $dotfiles::params::packages:
  } ->

  exec {'cask':
    command => $dotfiles::params::cask_command,
    user    => $dotfiles::params::user,
  } ->

  exec {'pyenv':
    command => $dotfiles::params::pyenv_command,
    user    => $dotfiles::params::user,
  }
}
