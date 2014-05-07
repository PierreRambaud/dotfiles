# encoding: UTF-8
# coding: UTF-8
# -*- coding: UTF-8 -*-

require_relative 'spec_helper'

describe 'dotfiles::install' do
  let(:chef_run) { ChefSpec::Runner.new(UBUNTU_OPTS).converge(described_recipe) }

  it 'include recipes' do
    expect(chef_run).to include_recipe('dotfiles::install_rbenv')
    expect(chef_run).to include_recipe('dotfiles::install_pyenv')
  end

  it 'install packages' do
    chef_run.node['dotfiles']['packages'].each do |item|
      expect(chef_run).to install_package(item)
    end
  end
end
