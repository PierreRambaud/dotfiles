# == Class dotfiles::install::tools
#
class dotfiles::install::tools {
  include dotfiles::params

  Exec {
    path => ['/usr/bin', '/usr/sbin', '/bin', '/sbin'],
  }

  package { $dotfiles::params::packages:
    ensure => installed
  }

  exec {'cask':
    command => $dotfiles::params::cask_command,
    creates => "${dotfiles::params::user_home_dir}.cask",
    cwd     => $dotfiles::params::user_home_dir,
  } ->

  file {"${dotfiles::params::user_home_dir}.cask":
    ensure => directory,
    group  => $dotfiles::params::user_name,
    owner  => $dotfiles::params::user_name,
  }

  exec {'rbenv':
    command => $dotfiles::params::rbenv_command,
    creates => "${dotfiles::params::user_home_dir}.rbenv",
    cwd     => $dotfiles::params::user_home_dir,
  } ->

  file {"${dotfiles::params::user_home_dir}.rbenv":
    ensure => directory,
    group  => $dotfiles::params::user_name,
    owner  => $dotfiles::params::user_name,
  }

  exec {'pyenv':
    command => $dotfiles::params::pyenv_command,
    creates => "${dotfiles::params::user_home_dir}.pyenv",
    cwd     => $dotfiles::params::user_home_dir,
  } ->

  file {"${dotfiles::params::user_home_dir}.pyenv":
    ensure => directory,
    group  => $dotfiles::params::user_name,
    owner  => $dotfiles::params::user_name,
  }
}
