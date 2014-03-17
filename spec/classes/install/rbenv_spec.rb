require 'spec_helper'

describe 'dotfiles::install::rbenv' do
  context 'supported operating systems' do
    ['Debian'].each do |osfamily|
      describe "dotfiles::install::rbenv class without any parameters on #{osfamily}" do
        let(:params) {{ }}
        let(:facts) {{
          :osfamily => osfamily,
        }}

        it { should contain_class('dotfiles::params') }

        it { should contain_rbenv__install('got') }

        it { should contain_rbenv__compile('1.9.3-p327')
            .with_user('got')
        }
      end
    end
  end
end
