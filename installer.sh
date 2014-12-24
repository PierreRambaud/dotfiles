#!/bin/bash
set -e
apt-get update
apt-get install -y curl sudo git build-essential libxslt1-dev ruby-dev libxml++2.6-dev libreadline-dev ruby

echo 'Install Chef...'
curl -L https://www.chef.io/chef/install.sh | sudo bash

echo 'Install Berks...'
gem install berkshelf --no-ri --no-rdoc

if [[ ! -d '/tmp/dotfiles' ]]; then
  echo 'Clone dotfiles...'
  mkdir -p /var/chef/
  pushd /tmp
  git clone https://github.com/PierreRambaud/dotfiles.git
  popd
fi

if [[ ! -d '/var/chef/cookbooks' ]]; then
  pushd /tmp/dotfiles
  echo 'Install cookbooks...'
  berks vendor /var/chef/cookbooks
  popd
fi

cat << EOT > /var/chef/solo.rb
node_name "my-compute-name"
cookbook_path ['/var/chef/cookbooks']
EOT

cat << EOT > /var/chef/dna.json
{
    "run_list": [
        "recipe[dotfiles]"
    ],
    "dotfiles": {
        "user": "prambaud",
        "user_home": "/home/prambaud",
        "theme": "GotRedBlack"
    }
}
EOT

chef-solo -c /var/chef/solo.rb -j /var/chef/dna.json

echo 'Purge useless ruby on the system...'
apt-get purge -y ruby-dev ruby

echo 'Done!'
