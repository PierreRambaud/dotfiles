# frozen_string_literal: true

require_relative 'spec_helper'

describe 'dotfiles::default' do
  let(:chef_run) { ChefSpec::SoloRunner.new(DEBIAN_OPTS).converge(described_recipe) }

  it 'includes recipes' do
    expect(chef_run).to include_recipe('apt')
    expect(chef_run).to include_recipe('dotfiles::install')
    expect(chef_run).to include_recipe('dotfiles::config')
    expect(chef_run).to include_recipe('dotfiles::service')
  end

  it 'should chown the home directory' do
    expect(chef_run).to run_execute('chown-home-directory')
      .with(command: 'chown -hR got:got /home/got')
  end
end
