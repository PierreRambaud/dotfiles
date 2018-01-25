# frozen_string_literal: true

require 'chefspec'
require 'chefspec/berkshelf'

ChefSpec::Coverage.start! { add_filter 'dotfiles' }

require 'chef/application'

shared_context 'dotfiles_stubs' do
  before do
    stub_command('which php').and_return('/usr/bin/php')
  end
end

DEBIAN_OPTS = {
  platform: 'debian',
  version: '9.3',
  log_level: :fatal
}.freeze
