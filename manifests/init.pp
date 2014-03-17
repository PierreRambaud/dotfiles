# == Class: dotfiles
#
class dotfiles (
) inherits dotfiles::params {

  class { 'dotfiles::install': } ->
  class { 'dotfiles::config': } ~>
  class { 'dotfiles::service': } ->
  Class['dotfiles']
}
