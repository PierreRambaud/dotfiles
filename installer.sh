#!/bin/bash
set -e
apt-get update
apt-get install -y curl git build-essential autoconf
TYPE=$1
DOTFILES_DIRECTORY='/opt/dotfiles'
BIN_DIRECTORY='/opt/chef/embedded/bin'

echo 'Install Chef...'
curl -L https://www.chef.io/chef/install.sh | sudo bash

if [[ ! -d "$DOTFILES_DIRECTORY" ]]; then
  echo 'Clone dotfiles...'
  git clone https://github.com/PierreRambaud/dotfiles.git $DOTFILES_DIRECTORY
fi

pushd $DOTFILES_DIRECTORY
echo 'Bundle install...'
$BIN_DIRECTORY/gem install bundler --no-ri --no-rdoc
$BIN_DIRECTORY/bundle install

if [[ ! -d "$DOTFILES_DIRECTORY/berks-cookbooks" ]]; then
  echo 'Install cookbooks...'
  $BIN_DIRECTORY/bundle exec rake vendor
fi

popd
$BIN_DIRECTORY/bundle exec rake converge:$TYPE

echo 'Done!'
