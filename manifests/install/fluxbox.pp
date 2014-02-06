# == Class dotfiles::install
#
class dotfiles::install::fluxbox {
  include dotfiles::params

  $home_directory = $dotfiles::params::user_home_dir

  file {'.fluxbox':
    ensure  => directory,
    path    => "${dotfiles::params::user_home_dir}.fluxbox",
    source  => 'puppet:///modules/dotfiles/fluxbox',
    owner   => $dotfiles::params::user_name,
    group   => $dotfiles::params::user_name,
    recurse => true,
    require => Package['fluxbox']
  }

  file {'fluxbox/init':
    ensure  => present,
    path    => "${dotfiles::params::user_home_dir}.fluxbox/init",
    content => template('dotfiles/fluxbox/init.erb'),
    owner   => $dotfiles::params::user_name,
    group   => $dotfiles::params::user_name,
  }

  file {'fluxbox/lastwallpapper':
    ensure  => present,
    path    => "${dotfiles::params::user_home_dir}.fluxbox/lastwallpaper",
    content => template('dotfiles/fluxbox/lastwallpaper.erb'),
    owner   => $dotfiles::params::user_name,
    group   => $dotfiles::params::user_name,
  }
}
