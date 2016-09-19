name 'dotfiles'
maintainer 'Pierre Rambaud'
maintainer_email 'pierre.rambaud86@gmail.com'
license 'LGPLv3'
description 'Installs/Configures my dotfiles'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '0.1.1'

issues_url 'https://github.com/PierreRambaud/dotfiles/issues'
source_url 'https://github.com/PierreRambaud/dotfiles'

recipe 'dotfiles', 'Installs and configures my dotfiles on a single system'

depends 'apt'
depends 'build-essential'
depends 'pyenv'
depends 'rbenv'
