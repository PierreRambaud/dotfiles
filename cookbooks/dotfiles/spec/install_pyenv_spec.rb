# frozen_string_literal: true

require_relative 'spec_helper'

describe 'dotfiles::install_pyenv' do
  let(:chef_run) { ChefSpec::SoloRunner.new(DEBIAN_OPTS).converge(described_recipe) }

  it 'should install pyenv' do
    expect(chef_run).to install_pyenv_plugin('virtualenv')
  end
end
