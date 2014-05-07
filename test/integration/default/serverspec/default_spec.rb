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

%w(config/terminator conkyrc).each do |path|
  describe direcotry('/home/got/.' + path) do
    it { should be_directory }
  end
end

%w(rbenv conky fluxbox pyenv).each do |item|
  describe command("type #{item}") do
    it { should return_code 0 }
  end
end
