# encoding: UTF-8
# coding: UTF-8
# -*- coding: UTF-8 -*-
#
require 'spec_helper'

%w(gitconfig gitignore bashrc bash_aliases).each do |item|
  describe file("/home/got/.#{item}") do
    it { should be_file }
  end
end

%w(config/terminator conkyrc emacs.d emacs.d/.cask).each do |path|
  describe file("/home/got/.#{path}") do
    it { should be_directory }
    it { should be_owned_by 'got' }
  end
end

%w(emacs rbenv conky fluxbox pyenv).each do |item|
  describe command("type #{item}") do
    its(:exit_status) { should eq 0 }
  end
end
