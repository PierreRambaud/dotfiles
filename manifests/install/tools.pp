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
}
