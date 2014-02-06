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
            .with_recurse('true')
        }
      end
    end
  end
end
