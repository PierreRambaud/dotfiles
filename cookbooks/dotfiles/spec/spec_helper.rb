# -*- coding: utf-8 -*-

require 'chefspec'
require 'chefspec/berkshelf'

ChefSpec::Coverage.start! { add_filter 'dotfiles' }

require 'chef/application'

LOG_LEVEL = :fatal

shared_context 'dotfiles_stubs' do
  before do
    stub_command('which php').and_return('/usr/bin/php')
  end
end

DEBIAN_OPTS = {
  platform: 'debian',
  version: 'jessie/sid',
  log_level: LOG_LEVEL
}.freeze
