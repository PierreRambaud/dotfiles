# == Class dotfiles::install::git
#
class dotfiles::install::git {
  include dotfiles::params

  file {'gitconfig':
    ensure  => present,
    path    => "${dotfiles::params::user_home_dir}.gitconfig",
    source  => 'puppet:///modules/dotfiles/bash_aliases',
    owner   => $dotfiles::params::user_name,
    group   => $dotfiles::params::user_name,
  } ->

  file {'gitignore':
    ensure  => present,
    path    => "${dotfiles::params::user_home_dir}.gitignore",
    source  => 'puppet:///modules/dotfiles/bash_aliases',
    owner   => $dotfiles::params::user_name,
    group   => $dotfiles::params::user_name,
  }
}
