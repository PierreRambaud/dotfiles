#!/bin/bash
set -e
apt-get update
apt-get install -y curl git build-essential autoconf

TYPE=$1
DOTFILES_DIRECTORY='/opt/dotfiles'
BIN_DIRECTORY='/opt/chef/embedded/bin'
PATH=$BIN_DIRECTORY:$PATH

echo "PATH: $PATH"

if [[ ! -d "$BIN_DIRECTORY" ]]; then
  echo 'Install Chef...'
  curl -L https://www.chef.io/chef/install.sh | bash
fi

if [[ ! -d "$DOTFILES_DIRECTORY" ]]; then
  echo 'Clone dotfiles...'
  git clone https://github.com/PierreRambaud/dotfiles.git $DOTFILES_DIRECTORY
fi

pushd $DOTFILES_DIRECTORY
echo 'Bundle install...'
$BIN_DIRECTORY/gem install bundler
$BIN_DIRECTORY/bundle install --without integration

if [[ ! -d "$DOTFILES_DIRECTORY/berks-cookbooks" ]]; then
  echo 'Install cookbooks...'
  $BIN_DIRECTORY/bundle exec rake vendor
fi

echo "Converging..."
$BIN_DIRECTORY/bundle exec rake converge:$TYPE
popd

echo 'Done!'
