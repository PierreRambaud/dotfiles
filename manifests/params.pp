# == Class dotfiles::params
#
# This class is meant to be called from dotfiles
# It sets variables according to platform
#
class dotfiles::params {
  case $::osfamily {
    'Debian': {
      $packages = [
          'rake',
          'terminator',
          'fluxbox',
          'xscreensaver',
          'conky',
          'git',
          'xdotool',
          'build-essential',
          'libssl-dev',
          'zlib1g-dev',
          'libbz2-dev',
          'libreadline-dev',
          'libsqlite3-dev',
          'wget',
          'curl',
          'llvm'
      ]

      $cask_command = 'git clone https://github.com/cask/cask.git'

      $user_name = 'got'
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
