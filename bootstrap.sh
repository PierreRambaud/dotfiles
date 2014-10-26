#!/bin/bash
#
# This script not working for the moment!
#
#Install chef and ruby dependencies
apt-get install curl rubygems-integration
curl -I http://www.getchef.com/chef/install.sh | sh

gem install bundler
git clone https://github.com/PierreRambaud/dotfiles.git
mkdir -p /var/chef
bundle install
bundle exec berks vendor /var/chef/cookbooks

cat >> /var/chef/solo.rb << EOF
node_name "my-computer"
cookbook_path ['/var/chef/cookbooks']
EOF

cat >> /var/chef/dna.json << EOF
{
    "run_list": [
        "recipe[dotfiles]"
    ],
    "dotfiles": {
        "user": "prambaud",
        "user_home": "/home/prambaud",
        "theme": "GotBlueBlack"
    }
}
EOF

chef-solo -c /var/chef/solo.rb -j /var/chef/dna.json
