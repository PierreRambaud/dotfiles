# == Class dotfiles::install::rbenv
#
class dotfiles::install::rbenv {
  include dotfiles::params

  rbenv::install {$dotfiles::params::user_name: }

  rbenv::compile { '1.9.3-p327':
    user   => $dotfiles::params::user_name,
  }
}
