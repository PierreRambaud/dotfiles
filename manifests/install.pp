# == Class dotfiles::install
#
class dotfiles::install {
  include dotfiles::params
  $home_directory = "/home/${dotfiles::params::user}/"

  user {$dotfiles::params::user:
    ensure     => present,
    managehome => true,
    password   => $dotfiles::params::user_password,
  } ->

  install_package { $dotfiles::params::packages:
  } ->

  exec {'cask':
    command => $dotfiles::params::cask_command,
    cwd     => $home_directory,
    user    => $dotfiles::params::user,
  } ->

  exec {'pyenv':
    command => $dotfiles::params::pyenv_command,
    cwd     => $home_directory,
    user    => $dotfiles::params::user,
  }

  file {'.fluxbox':
    ensure  => directory,
    path    => "${home_directory}.fluxbox",
    source  => 'puppet:///modules/dotfiles/fluxbox',
    owner   => $dotfiles::params::user,
    group   => $dotfiles::params::user,
    recurse => true,
    require => Package['fluxbox']
  } ->

  file {'.conkyrc':
    ensure  => directory,
    path    => "${home_directory}.conkyrc",
    source  => 'puppet:///modules/dotfiles/conkyrc',
    owner   => $dotfiles::params::user,
    group   => $dotfiles::params::user,
    recurse => true,
    require => Package['conky']
  } ->

  file {'bash_aliases':
    ensure  => present,
    path    => "${home_directory}.bash_aliases",
    source  => 'puppet:///modules/dotfiles/bash_aliases',
    owner   => $dotfiles::params::user,
    group   => $dotfiles::params::user,
  } ->

  file {'bashrc':
    ensure  => present,
    path    => "${home_directory}.bashrc",
    source  => 'puppet:///modules/dotfiles/bashrc',
    owner   => $dotfiles::params::user,
    group   => $dotfiles::params::user,
  } ->

  file {'gitconfig':
    ensure  => present,
    path    => "${home_directory}.gitconfig",
    source  => 'puppet:///modules/dotfiles/bash_aliases',
    owner   => $dotfiles::params::user,
    group   => $dotfiles::params::user,
  } ->

  file {'gitignore':
    ensure  => present,
    path    => "${home_directory}.gitignore",
    source  => 'puppet:///modules/dotfiles/bash_aliases',
    owner   => $dotfiles::params::user,
    group   => $dotfiles::params::user,
  }
}
