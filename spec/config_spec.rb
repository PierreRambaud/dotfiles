# encoding: UTF-8
# coding: UTF-8
# -*- coding: UTF-8 -*-

require_relative 'spec_helper'

describe 'dotfiles::config' do
  let(:chef_run) { ChefSpec::Runner.new(UBUNTU_OPTS).converge(described_recipe) }

  it 'configure bash' do
    %w(bash_aliases bashrc).each do |item|
      expect(chef_run).to create_cookbook_file(item)
        .with(source: item,
              path: "/home/got/.#{item}",
              owner: 'got',
              group: 'got')
    end
  end

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

  it 'configure git' do
    %w(gitconfig gitignore).each do |item|
      expect(chef_run).to create_cookbook_file(item)
        .with(source: item,
              path: "/home/got/.#{item}",
              owner: 'got',
              group: 'got')
    end
  end

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
    expect(chef_run).to create_file('/home/got/.fluxbox/scripts/move-window.sh')
      .with(owner: 'got',
            group: 'got')
    expect(chef_run).to run_execute('chown-fluxbox')
      .with(command: 'chown -hR got:got /home/got/.fluxbox')
  end

  it 'configure conkyrc' do
    expect(chef_run).to create_remote_directory('conkyrc')
      .with(source: 'conkyrc',
            path: '/home/got/.conkyrc',
            owner: 'got',
            group: 'got')

    %w(computer general network system).each do |item|
      expect(chef_run).to create_template("conkyrc/#{item}")
        .with(source: "conkyrc/#{item}.erb",
              path: "/home/got/.conkyrc/#{item}",
              owner: 'got',
              group: 'got')
      expect(chef_run).to run_execute('chown-conkyrc')
        .with(command: 'chown -hR got:got /home/got/.conkyrc')
    end
  end
end
