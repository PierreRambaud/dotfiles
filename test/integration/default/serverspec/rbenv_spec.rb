# -*- coding: utf-8 -*-
#
require 'spec_helper'

context '#rbenv' do
  ['1.9.3-p551', '2.0.0-p598', '2.1.5'].each do |version|
    describe file("/home/got/.rbenv/versions/#{version}") do
      it { should be_directory }
      it { should be_grouped_into 'got' }
      it { should be_owned_by 'got' }
    end

    ['bundler'].each do |pkg|
      describe file("/home/got/.rbenv/versions/#{version}/bin/#{pkg}") do
        it { should be_file }
        it { should be_executable }
        it { should be_grouped_into 'got' }
        it { should be_owned_by 'got' }
      end
    end
  end

  describe file('/home/got/.rbenv/version') do
    it { should be_file }
    it { should be_grouped_into 'got' }
    it { should be_owned_by 'got' }
    its(:content) { should match(/2.1.5/) }
  end
end
