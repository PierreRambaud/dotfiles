# == Class dotfiles::params
#
# This class is meant to be called from dotfiles
# It sets variables according to platform
#
class dotfiles::params {
  case $::osfamily {
    'Debian': {
      $packages = ['rake', 'terminator', 'fluxbox', 'xscreensaver', 'conky']
      $cask_command = 'curl -fsSkL https://raw.github.com/cask/cask/master/go | python'
      $pyenv_command = 'cd && git clone git://github.com/yyuu/pyenv.git .pyenv'
      $user          = 'got'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
