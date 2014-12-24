# -*- coding: utf-8 -*-

require_relative 'spec_helper'

describe 'dotfiles::install' do
  let(:chef_run) { ChefSpec::SoloRunner.new(DEBIAN_OPTS).converge(described_recipe) }

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
    expect(chef_run).to sync_git('install-emacs-configuration')
      .with(destination: '/home/got/.emacs.d',
            repository: 'https://github.com/PierreRambaud/emacs.d.git',
            enable_submodules: true,
            user: 'got',
            group: 'got')

    cask_installer = "#{Chef::Config[:file_cache_path]}/cask-install.py"
    expect(chef_run).to create_remote_file('download-cask-installer')
      .with(source: 'https://raw.github.com/cask/cask/master/go',
            path: cask_installer)

    expect(chef_run).to run_execute('install-cask')
      .with(command: "python #{cask_installer}",
            environment: { 'HOME' => '/home/got', 'USER' => 'got' })

    expect(chef_run).to run_execute('install-emacs-dependencies')
      .with(cwd: '/home/got/.emacs.d',
            environment: { 'PATH' => "#{ENV['PATH']}:#{ENV['HOME']}/.cask/bin" },
            command: 'cask install')
  end
end
