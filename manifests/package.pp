# == Class dotfiles::package
#
# This class is meant to be called from dotfiles
# It ensure the package is installed
#
class dotfiles::package {
  include dotfiles::params

  package {$dotfiles::params::package:
    ensure => installed
  }
}
