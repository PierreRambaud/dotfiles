# frozen_string_literal: true

require_relative 'spec_helper'

describe 'dotfiles::service' do
  let(:chef_run) { ChefSpec::SoloRunner.new(DEBIAN_OPTS).converge(described_recipe) }

  it 'restart fluxbox' do
    expect(chef_run).to run_execute('restart-fluxbox').with(
      command: 'fluxbox-remote "Restart"',
      environment: {
        'PATH' => "/bin:/usr/bin:#{ENV['PATH']}"
      }
    )
  end
end
