#Got's dotfiles

[![Build Status](https://travis-ci.org/PierreRambaud/dotfiles.png?branch=master)](https://travis-ci.org/PierreRambaud/dotfiles)

My dotfiles with puppet.

##Dependencies
- Puppet 3.4.0 or greater

##Usage

Install puppet's module dependencies as root:

```bash
mkdir -p /etc/puppet/modules
cd /etc/puppet/modules
git clone https://github.com/PierreRambaud/dotfiles.git
cd dotfiles
gem install librarian-puppet
librarian-puppet install --path ../
```

Install dotfiles:

```bash
sudo puppet apply --modulepath=/etc/puppet/modules/ -e "include dotfiles" --verbose
```

You must run this command with sudo or root otherwise some dependencies will not be installed.

##Change theme and user

To change the user name, edit the variable `$theme` in `manifests/params.pp`.
To change the current theme, edit the variable `$user_name` in `manifests/params.pp`.


##Run tests

Run syntax, lint, and spec tests:

```bash
bundle exec rake test
```

Run acceptance tests:

```bash
bundle exec rake acceptance
```


[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/PierreRambaud/dotfiles/trend.png)](https://bitdeli.com/free "Bitdeli Badge")

