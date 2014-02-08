# == Class dotfiles::config
#
# This class is called from dotfiles
#
class dotfiles::config {
  include dotfiles::config::fluxbox
  include dotfiles::config::conky
  include dotfiles::config::git
  include dotfiles::config::bash
  include dotfiles::config::terminator
}
