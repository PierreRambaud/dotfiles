# frozen_string_literal: true

require 'spec_helper'

context '#config git and bash' do
  %w[gitconfig gitignore bashrc bash_aliases bash_colors xscreensaver].each do |item|
    describe file("/home/got/.#{item}") do
      it { should be_file }
      it { should be_grouped_into 'got' }
      it { should be_owned_by 'got' }
    end
  end
end

context '#config directories' do
  %w[config/terminator conkyrc fluxbox emacs.d emacs.d/.cask].each do |path|
    describe file("/home/got/.#{path}") do
      it { should be_directory }
      it { should be_grouped_into 'got' }
      it { should be_owned_by 'got' }
    end
  end
end

context '#config conky terminator themes' do
  %w[conkyrc/got config/terminator/config].each do |item|
    describe file("/home/got/.#{item}") do
      it { should be_file }
      it { should be_grouped_into 'got' }
      it { should be_owned_by 'got' }
      its(:content) { should match(/D00402/) }
    end
  end
end

context '#config fluxbox theme' do
  %w[fluxbox/init].each do |item|
    describe file("/home/got/.#{item}") do
      it { should be_file }
      it { should be_grouped_into 'got' }
      it { should be_owned_by 'got' }
      its(:content) { should match(/GotRedBlack/) }
    end
  end
end

context '#tools' do
  describe file('/home/got/.fluxbox/scripts/move-window.py') do
    it { should be_file }
    it { should be_executable }
    it { should be_grouped_into 'got' }
    it { should be_owned_by 'got' }
  end

  %w[emacs rbenv conky fluxbox pyenv nodenv].each do |item|
    describe command("type #{item}") do
      its(:exit_status) { should eq 0 }
    end
  end
end
