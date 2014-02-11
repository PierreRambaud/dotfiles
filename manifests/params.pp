# == Class dotfiles::params
#
# This class is meant to be called from dotfiles
# It sets variables according to platform
#
class dotfiles::params {
  case $::osfamily {
    'Debian': {
      $packages = ['rake', 'terminator', 'fluxbox', 'xscreensaver', 'conky', 'git']

      $cask_command = 'git clone https://github.com/cask/cask.git'
      $pyenv_command = 'git clone git://github.com/yyuu/pyenv.git .pyenv'

      $user_name = 'prambaud'
      $user_home_dir = "/home/${user_name}/"

      $theme = 'GotWhiteBlack'

      $theme_color = $dotfiles::params::theme ? {
        'GotRedBlack'  => 'D00402',
        'GotBlueBlack' => '1b5b74',
        'GotWhiteBlack' => 'ffffff'
      }

      $theme_fg_color = $dotfiles::params::theme ? {
        'GotRedBlack'  => 'ffffff',
        'GotBlueBlack' => 'ffffff',
        'GotWhiteBlack' => '000000'
      }
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
