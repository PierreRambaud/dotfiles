require 'spec_helper'

describe 'dotfiles::config::terminator' do
  context 'supported operating systems' do
    ['Debian'].each do |osfamily|
      describe "dotfiles::config::terminator class without any parameters on #{osfamily}" do
        let(:params) {{ }}
        let(:facts) {{
          :osfamily => osfamily,
        }}

        it { should compile.with_all_deps }

        it { should contain_class('dotfiles::params') }

        it { should contain_file('.config')
            .with_ensure('directory')
            .with_owner('got')
            .with_group('got')
        }

        it { should contain_file('.config/terminator')
            .with_ensure('directory')
            .with_owner('got')
            .with_group('got')
        }

        it { should contain_file('.config/terminator/config')
            .with_ensure('present')
            .with_owner('got')
            .with_group('got')
        }
      end
    end
  end
end
