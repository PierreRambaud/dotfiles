require 'spec_helper'

describe 'dotfiles::config::bash' do
  context 'supported operating systems' do
    ['Debian'].each do |osfamily|
      describe "dotfiles class without any parameters on #{osfamily}" do
        let(:params) {{ }}
        let(:facts) {{
          :osfamily => osfamily,
        }}

        it { should compile.with_all_deps }

        it { should contain_class('dotfiles::params') }

        it { should contain_file('bash_aliases')
            .with_ensure('present')
        }

        it { should contain_file('bashrc')
            .with_ensure('present')
        }
      end
    end
  end
end
