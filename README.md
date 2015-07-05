# Got's dotfiles Cookbook [![Build Status](https://travis-ci.org/PierreRambaud/dotfiles.svg?branch=master)](https://travis-ci.org/PierreRambaud/dotfiles)

My dotfiles generated with Chef using my [dotfiles cookbook](cookbooks/dotfiles)

## Requirements

Ruby 2.0 or higher

## Usage

### Running the installer:

```bash
$ cd /tmp
$ wget https://raw.githubusercontent.com/PierreRambaud/dotfiles/master/installer.sh
$ ./installer.sh
```

### Running with Rake:

```bash
$ bundle install
$ bundle exec rake vendor
$ bundle exec rake converge:home
```

## Run tests

`bundle exec rubocop` to execute rubocop

`bundle exec foodcritic ./` to execute foodcritic

`bundle exec kitchen test` to execute kitchen

## License and Authors

Authors:

  - [Pierre Rambaud](pierre.rambaud86@gmail.com)
