# == Class dotfiles::service
#
# This class is meant to be called from dotfiles
# It ensure the service is running
#
class dotfiles::service {
  include dotfiles::params

  service { $dotfiles::params::service_name:
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }
}
