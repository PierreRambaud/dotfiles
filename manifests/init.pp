# == Class: dotfiles
#
# Full description of class dotfiles here.
#
# === Parameters
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#
class dotfiles (
) inherits dotfiles::params {

  # validate parameters here

  Exec {
    path => ['/usr/bin', '/usr/sbin', '/bin', '/sbin'],
  }

  class { 'dotfiles::install': } ->
  class { 'dotfiles::config': } ~>
  class { 'dotfiles::service': } ->
  Class['dotfiles']
}
