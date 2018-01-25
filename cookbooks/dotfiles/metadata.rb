# frozen_string_literal: true

name 'dotfiles'
maintainer 'Pierre Rambaud'
maintainer_email 'pierre.rambaud86@gmail.com'
license 'LGPLv3'
description 'Installs/Configures my dotfiles'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '0.1.2'
chef_version '>= 12.5' if respond_to?(:chef_version)

supports 'debian'
license 'Apache-2.0'

issues_url 'https://github.com/PierreRambaud/dotfiles/issues'
source_url 'https://github.com/PierreRambaud/dotfiles'

recipe 'dotfiles', 'Installs and configures my dotfiles on a single system'

depends 'apt'
depends 'build-essential'
depends 'pyenv'
depends 'ruby_rbenv'
depends 'ndenv'
