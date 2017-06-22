# -*- coding: utf-8 -*-

require_relative 'spec_helper'

describe 'dotfiles::config' do
  let(:chef_run) { ChefSpec::SoloRunner.new(DEBIAN_OPTS).converge(described_recipe) }

  it 'configure bash and xscreensaver' do
    %w[bash_aliases bash_colors bashrc xscreensaver].each do |item|
      expect(chef_run).to create_cookbook_file(item)
        .with(source: item,
              path: "/home/got/.#{item}",
              owner: 'got',
              group: 'got')
    end
  end
end

describe 'dotfiles::config' do
  let(:chef_run) { ChefSpec::SoloRunner.new(DEBIAN_OPTS).converge(described_recipe) }

  it 'configure terminator' do
    expect(chef_run).to create_directory('terminator')
      .with(path: '/home/got/.config/terminator',
            owner: 'got',
            group: 'got',
            recursive: true)

    expect(chef_run).to create_template('config/terminator/config')
      .with(source: 'config/terminator/config.erb',
            path: '/home/got/.config/terminator/config',
            owner: 'got',
            group: 'got')
  end
end

describe 'dotfiles::config' do
  let(:chef_run) { ChefSpec::SoloRunner.new(DEBIAN_OPTS).converge(described_recipe) }

  it 'configure git' do
    %w[gitconfig gitignore].each do |item|
      expect(chef_run).to create_cookbook_file(item)
        .with(source: item,
              path: "/home/got/.#{item}",
              owner: 'got',
              group: 'got')
    end
  end
end

describe 'dotfiles::config' do
  let(:chef_run) { ChefSpec::SoloRunner.new(DEBIAN_OPTS).converge(described_recipe) }

  it 'configure fluxbox' do
    expect(chef_run).to create_remote_directory('fluxbox')
      .with(source: 'fluxbox',
            path: '/home/got/.fluxbox',
            owner: 'got',
            group: 'got')
    expect(chef_run).to create_template('fluxbox/init')
      .with(source: 'fluxbox/init.erb',
            path: '/home/got/.fluxbox/init',
            owner: 'got',
            group: 'got')
    expect(chef_run).to create_file('/home/got/.fluxbox/scripts/move-window.py')
      .with(owner: 'got',
            group: 'got',
            mode: '0755')
  end
end

describe 'dotfiles::config' do
  let(:chef_run) { ChefSpec::SoloRunner.new(DEBIAN_OPTS).converge(described_recipe) }

  it 'configure conkyrc' do
    expect(chef_run).to create_remote_directory('conkyrc')
      .with(source: 'conkyrc',
            path: '/home/got/.conkyrc',
            owner: 'got',
            group: 'got')

    expect(chef_run).to create_template('conkyrc/got')
      .with(source: 'conkyrc/got.erb',
            path: '/home/got/.conkyrc/got',
            owner: 'got',
            group: 'got')
  end
end
