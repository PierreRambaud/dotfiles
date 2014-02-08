require 'spec_helper'

describe 'dotfiles::config::conky' do
  context 'supported operating systems' do
    ['Debian'].each do |osfamily|
      describe "dotfiles::config::conky class without any parameters on #{osfamily}" do
        let(:params) {{ }}
        let(:facts) {{
          :osfamily => osfamily,
        }}

        it { should compile.with_all_deps }

        it { should contain_class('dotfiles::params') }

        it { should contain_file('.conkyrc')
            .with_ensure('directory')
            .with_owner('got')
            .with_group('got')
            .with_recurse('true')
        }

        it { should contain_file('.conkyrc/computer')
            .with_ensure('present')
            .with_owner('got')
            .with_group('got')
        }

        it { should contain_file('.conkyrc/general')
            .with_ensure('present')
            .with_owner('got')
            .with_group('got')
        }

        it { should contain_file('.conkyrc/system')
            .with_ensure('present')
            .with_owner('got')
            .with_group('got')
        }

        it { should contain_file('.conkyrc/network')
            .with_ensure('present')
            .with_owner('got')
            .with_group('got')
        }
      end
    end
  end
end
