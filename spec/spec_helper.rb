# encoding: UTF-8
# coding: UTF-8
# -*- coding: UTF-8 -*-

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

UBUNTU_OPTS = {
  platform: 'ubuntu',
  version: '13.04',
  log_level: LOG_LEVEL
}
