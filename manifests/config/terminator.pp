# == Class dotfiles::config::terminator
#
class dotfiles::config::terminator {
  include dotfiles::params

  file {'.config':
    ensure => directory,
    path   => "${dotfiles::params::user_home_dir}.config",
    owner  => $dotfiles::params::user_name,
    group  => $dotfiles::params::user_name,
  } ->

  file {'.config/terminator':
    ensure => directory,
    path   => "${dotfiles::params::user_home_dir}.config/terminator",
    owner  => $dotfiles::params::user_name,
    group  => $dotfiles::params::user_name,
  } ->

  file {'.config/terminator/config':
    ensure  => present,
    path    => "${dotfiles::params::user_home_dir}.config/terminator/config",
    content => template('dotfiles/config/terminator/config.erb'),
    owner   => $dotfiles::params::user_name,
    group   => $dotfiles::params::user_name,
  }
}
