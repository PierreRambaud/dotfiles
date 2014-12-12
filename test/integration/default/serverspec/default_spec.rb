# -*- coding: utf-8 -*-
#
require 'spec_helper'

%w(gitconfig gitignore bashrc bash_aliases).each do |item|
  describe file("/home/got/.#{item}") do
    it { should be_file }
    it { should be_grouped_into 'got' }
    it { should be_owned_by 'got' }
  end
end

%w(config/terminator conkyrc fluxbox emacs.d emacs.d/.cask emacs.d/prelude).each do |path|
  describe file("/home/got/.#{path}") do
    it { should be_directory }
    it { should be_grouped_into 'got' }
    it { should be_owned_by 'got' }
  end
end

describe file('/home/got/.fluxbox/scripts/move-window.sh') do
  it { should be_file }
  it { should be_executable }
  it { should be_grouped_into 'got' }
  it { should be_owned_by 'got' }
end

%w(emacs rbenv conky fluxbox pyenv).each do |item|
  describe command("type #{item}") do
    its(:exit_status) { should eq 0 }
  end
end

%w(conkyrc/got config/terminator/config).each do |item|
  describe file("/home/got/.#{item}") do
    it { should be_file }
    it { should be_grouped_into 'got' }
    it { should be_owned_by 'got' }
    its(:content) { should match(/D00402/) }
  end
end

%w(fluxbox/init).each do |item|
  describe file("/home/got/.#{item}") do
    it { should be_file }
    it { should be_grouped_into 'got' }
    it { should be_owned_by 'got' }
    its(:content) { should match(/GotRedBlack/) }
  end
end
