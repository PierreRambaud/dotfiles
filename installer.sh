#!/bin/bash
set -e
apt-get update
apt-get install -y curl sudo git

echo 'Install Chef...'
curl -L https://www.chef.io/chef/install.sh | sudo bash

echo 'Install Berks...'
/opt/chef/bin/gem install berkshelf --no-ri --no-rdoc

if [[ ! -d '/tmp/dotfiles' ]]; then
  echo 'Clone dotfiles...'
  mkdir -p /opt/dotfiles/
  pushd /tmp
  git clone https://github.com/PierreRambaud/dotfiles.git
  popd
fi

if [[ ! -d '/opt/dotfiles/cookbooks' ]]; then
  pushd /tmp/dotfiles
  echo 'Install cookbooks...'
  /opt/chef/bin/berks vendor /opt/dotfiles/cookbooks
  popd
fi

mkdir -p /opt/dotfiles/{chef-client,roles,environments}
mkdir -p /opt/dotfiles/data_bags/{zones,users}

tee /opt/dotfiles/client.rb <<EOF
file_cache_path '/opt/dotfiles/chef-client'
cookbook_path '/opt/dotfiles/cookbooks'
data_bag_path '/opt/dotfiles/data_bags'
role_path '/opt/dotfiles/roles'
chef_zero.enabled true
EOF

cat << EOT > /opt/dotfiles/dna.json
{
    "run_list": [
        "recipe[dotfiles]"
    ],
    "dotfiles": {
        "user": "got",
        "user_home": "/home/got",
        "theme": "GotRedBlack"
    }
}
EOT

chef-client -c /opt/dotfiles/solo.rb -j /opt/dotfiles/dna.json

echo 'Done!'
