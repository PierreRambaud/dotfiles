# == Class dotfiles::config::conky
#
class dotfiles::config::conky {
  include dotfiles::params

  file {'.conkyrc':
    ensure  => directory,
    path    => "${dotfiles::params::user_home_dir}.conkyrc",
    source  => 'puppet:///modules/dotfiles/conkyrc',
    owner   => $dotfiles::params::user_name,
    group   => $dotfiles::params::user_name,
    recurse => true,
  }

  file {'.conkyrc/computer':
    ensure  => present,
    path    => "${dotfiles::params::user_home_dir}.conkyrc/computer",
    content => template('dotfiles/conkyrc/computer'),
    owner   => $dotfiles::params::user_name,
    group   => $dotfiles::params::user_name,
    require => File['.conkyrc']
  }

  file {'.conkyrc/general':
    ensure  => present,
    path    => "${dotfiles::params::user_home_dir}.conkyrc/general",
    content => template('dotfiles/conkyrc/general'),
    owner   => $dotfiles::params::user_name,
    group   => $dotfiles::params::user_name,
    require => File['.conkyrc']
  }

  file {'.conkyrc/network':
    ensure  => present,
    path    => "${dotfiles::params::user_home_dir}.conkyrc/network",
    content => template('dotfiles/conkyrc/network'),
    owner   => $dotfiles::params::user_name,
    group   => $dotfiles::params::user_name,
    require => File['.conkyrc']
  }

  file {'.conkyrc/system':
    ensure  => present,
    path    => "${dotfiles::params::user_home_dir}.conkyrc/system",
    content => template('dotfiles/conkyrc/system'),
    owner   => $dotfiles::params::user_name,
    group   => $dotfiles::params::user_name,
    require => File['.conkyrc']
  }
}
