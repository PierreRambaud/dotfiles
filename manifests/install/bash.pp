# == Class dotfiles::install::bash
#
class dotfiles::install::bash {
  include dotfiles::params

  file {'bash_aliases':
    ensure  => present,
    path    => "${dotfiles::params::user_home_dir}.bash_aliases",
    source  => 'puppet:///modules/dotfiles/bash_aliases',
    owner   => $dotfiles::params::user_name,
    group   => $dotfiles::params::user_name,
  } ->

  file {'bashrc':
    ensure  => present,
    path    => "${dotfiles::params::user_home_dir}.bashrc",
    source  => 'puppet:///modules/dotfiles/bashrc',
    owner   => $dotfiles::params::user_name,
    group   => $dotfiles::params::user_name,
  }
}
