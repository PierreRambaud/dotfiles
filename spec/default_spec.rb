# -*- coding: utf-8 -*-

require_relative 'spec_helper'

describe 'dotfiles::default' do
  let(:chef_run) { ChefSpec::Runner.new(DEBIAN_OPTS).converge(described_recipe) }

  it 'includes recipes' do
    expect(chef_run).to include_recipe('apt')
    expect(chef_run).to include_recipe('dotfiles::install')
    expect(chef_run).to include_recipe('dotfiles::config')
    expect(chef_run).to include_recipe('dotfiles::service')
  end
end
