# -*- coding: utf-8 -*-

require_relative 'spec_helper'

describe 'dotfiles::install' do
  let(:chef_run) { ChefSpec::Runner.new(DEBIAN_OPTS).converge(described_recipe) }

  it 'include recipes' do
    expect(chef_run).to include_recipe('dotfiles::install_rbenv')
    expect(chef_run).to include_recipe('dotfiles::install_pyenv')
  end

  it 'install packages' do
    chef_run.node['dotfiles']['packages'].each do |item|
      expect(chef_run).to install_package(item)
    end
  end

  it 'should create user' do
    expect(chef_run).to create_user('got')
      .with(supports: { manage_home: true },
            home: '/home/got',
            shell: '/bin/bash')
  end

  it 'copy emacs configuration' do
    expect(chef_run).to sync_git('install-sliim-emacs')
      .with(destination: '/home/got/.emacs.d',
            repository: 'https://github.com/Sliim/emacs.d.git',
            enable_submodules: true,
            user: 'got',
            group: 'got')
    expect(chef_run).to sync_git('install-sliim-cask')
      .with(destination: '/home/got/.emacs.d/.cask',
            repository: 'https://github.com/Sliim/emacs.d-cask.git',
            user: 'got',
            group: 'got')
  end
end
