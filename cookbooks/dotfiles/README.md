Got's dotfiles Cookbook [![Build Status](https://travis-ci.org/PierreRambaud/dotfiles.svg?branch=master)](https://travis-ci.org/PierreRambaud/dotfiles)
================

My dotfiles with Opscode Chef.

Requirements
------------
Ruby 2.0 or higher

Attributes
----------

#### dotfiles::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['dotfiles']['user']</tt></td>
    <td>String</td>
    <td>User name</td>
    <td><tt>got</tt></td>
  </tr>
  <tr>
    <td><tt>['dotfiles']['user_home']</tt></td>
    <td>String</td>
    <td>User home</td>
    <td><tt>/home/#{node['dotfiles']['user']}</tt></td>
  </tr>
  <tr>
    <td><tt>['dotfiles']['theme']</tt></td>
    <td>String</td>
    <td>Theme of fluxbox used</td>
    <td><tt>GotWhiteBlack</tt></td>
  </tr>
  <tr>
    <td><tt>['dotfiles']['packages']</tt></td>
    <td>Array</td>
    <td>List of packages chef must installed</td>
    <td><tt>Very long list</tt></td>
  </tr>
  <tr>
    <td><tt>['dotfiles']['gem_packages']</tt></td>
    <td>Array</td>
    <td>List of gems packages chef must installed for ruby system</td>
    <td><tt>['volay']</tt></td>
  </tr>
</table>

Usage
-----
#### dotfiles::default
Just include `dotfiles` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[dotfiles]"
  ]
}
```

Run tests
---------

`bundle install` to install dependencies

`bundle exec berks install` to install cookbooks dependencies

`bundle exec rspec ./spec` to execute chefspec

`bundle exec rubocop` to execute rubocop

`bundle exec foodcritic ./` to execute foodcritic

`bundle exec kitchen test` to execute kitchen

License and Authors
-------------------
Authors: Pierre Rambaud (pierre.rambaud86@gmail.com)
