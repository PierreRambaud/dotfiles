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

      $user_name = 'got'
      $user_home_dir = "/home/${user_name}/"

      $theme = 'GotBlueDark'

      $theme_color = $dotfiles::params::theme ? {
        'GotRedDark'  => 'D00402',
        'GotBlueDark' => '5385fe',
      }

    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
