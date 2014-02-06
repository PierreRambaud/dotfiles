# == Class dotfiles::install::tools
#
class dotfiles::install::tools {
  include dotfiles::params

  install_package { $dotfiles::params::packages: }

  exec {'cask':
    command => $dotfiles::params::cask_command,
    creates => "${dotfiles::params::user_home_dir}.cask",
    cwd     => $dotfiles::params::user_home_dir,
    require => User[$dotfiles::params::user_name],
  } ->

  file {"${dotfiles::params::user_home_dir}.cask":
    ensure => directory,
    owner  => $dotfiles::params::user_name,
  }

  exec {'pyenv':
    command => $dotfiles::params::pyenv_command,
    creates => "${dotfiles::params::user_home_dir}.pyenv",
    cwd     => $dotfiles::params::user_home_dir,
    require => User[$dotfiles::params::user_name],
  } ->

  file {"${dotfiles::params::user_home_dir}.pyenv":
    ensure => directory,
    owner  => $dotfiles::params::user_name,
  }
}
