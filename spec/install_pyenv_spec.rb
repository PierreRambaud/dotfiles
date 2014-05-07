# encoding: UTF-8
# coding: UTF-8
# -*- coding: UTF-8 -*-

require_relative 'spec_helper'

describe 'dotfiles::install_pyenv' do
  let(:chef_run) { ChefSpec::Runner.new(UBUNTU_OPTS).converge(described_recipe) }

  it 'include recipes' do
    expect(chef_run).to include_recipe('pyenv::user')
  end
end
