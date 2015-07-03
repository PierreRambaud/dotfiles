# -*- coding: utf-8 -*-

require_relative 'spec_helper'

describe 'dotfiles::install_rbenv' do
  let(:chef_run) { ChefSpec::SoloRunner.new(DEBIAN_OPTS).converge(described_recipe) }

  it 'include recipes' do
    expect(chef_run).to include_recipe('rbenv')
    expect(chef_run).to include_recipe('rbenv::ruby_build')
  end

  [['1.9.3-p551', false], ['2.0.0-p598', false], ['2.1.5', true]].each do |version, is_global|
    context "#ruby-#{version}" do
      it 'install ruby' do
        expect(chef_run).to install_rbenv_ruby(version)
          .with(global: is_global)
      end

      it 'install gems' do
        %w(bundler).each do |pkg|
          expect(chef_run).to install_rbenv_gem("#{pkg}-ruby-#{version}")
            .with(package_name: pkg,
                  ruby_version: version)
        end
      end
    end
  end
end
