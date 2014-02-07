# == Class dotfiles::config::git
#
class dotfiles::config::git {
  include dotfiles::params

  file {'gitconfig':
    ensure  => present,
    path    => "${dotfiles::params::user_home_dir}.gitconfig",
    source  => 'puppet:///modules/dotfiles/gitconfig',
    owner   => $dotfiles::params::user_name,
    group   => $dotfiles::params::user_name,
  } ->

  file {'gitignore':
    ensure  => present,
    path    => "${dotfiles::params::user_home_dir}.gitignore",
    source  => 'puppet:///modules/dotfiles/gitignore',
    owner   => $dotfiles::params::user_name,
    group   => $dotfiles::params::user_name,
  }
}
