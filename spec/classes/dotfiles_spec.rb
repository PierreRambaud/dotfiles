require 'spec_helper'

describe 'dotfiles' do
  context 'supported operating systems' do
    ['Debian'].each do |osfamily|
      describe "dotfiles class without any parameters on #{osfamily}" do
        let(:params) {{ }}
        let(:facts) {{
          :osfamily => osfamily,
        }}

        it { should contain_class('dotfiles::params') }

        it { should contain_class('dotfiles::install').that_comes_before('dotfiles::config') }
        it { should contain_class('dotfiles::config') }
        it { should contain_class('dotfiles::service').that_subscribes_to('dotfiles::config') }
      end
    end
  end

  context 'unsupported operating system' do
    describe 'dotfiles class without any parameters on Solaris/Nexenta' do
      let(:facts) {{
        :osfamily        => 'Solaris',
        :operatingsystem => 'Nexenta',
      }}

      it { expect { should contain_package('dotfiles') }.to raise_error(Puppet::Error, /Nexenta not supported/) }
    end
  end
end
