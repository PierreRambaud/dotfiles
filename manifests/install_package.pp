#Define function install_package
define dotfiles::install_package () {
  package {$name:
    ensure => installed
  }
}
