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
    require => Package['conky']
  }
}
