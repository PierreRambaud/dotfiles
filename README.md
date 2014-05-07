Got's dotfiles Cookbook
================
My dotfiles with Opscode Chef.

Requirements
------------
Ruby 1.9.3 or higher

#### packages
- `ruby` - A version of ruby >= 1.9.3

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
    <td><tt>rake terminator fluxbox xscreensaver conky xdotool libbz2-dev libsqlite3-dev wget llvm</tt></td>
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
`bundle exec strainer test` to execute chefspec, foodcritic, knife test, rubocop and kitchen
`bundle exec strainer test -e kitchen` to exclude kitchen tests

License and Authors
-------------------
Authors: Pierre Rambaud (pierre.rambaud86@gmail.com)
