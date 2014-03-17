# == Class dotfiles::install::pyenv
#
class dotfiles::install::pyenv {
  include dotfiles::params

  pyenv::install { $dotfiles::params::user_name: } ->

  pyenv::compile { '3.3.2':
    user   => $dotfiles::params::user_name,
    python => '3.3.2',
  } ->

  pip { '3.3.2 tools':
    ensure         => 'installed',
    package        => ['yoda', 'usblamp', 'groove-dl'],
    user           => $dotfiles::params::user_name,
    python_version => '3.3.2',
  } ->


  pyenv::compile { '2.7.5':
    user   => $dotfiles::params::user_name,
    python => '2.7.5',
    global => true,
  } ->

  pip { '2.7.5 tools':
    ensure         => 'installed',
    package        => ['yoda'],
    user           => $dotfiles::params::user_name,
    python_version => '2.7.5',
  }
}
