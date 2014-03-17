require 'spec_helper'

describe 'dotfiles::install' do
  context 'supported operating systems' do
    ['Debian'].each do |osfamily|
      describe "dotfiles::install class without any parameters on #{osfamily}" do
        let(:params) {{ }}
        let(:facts) {{
          :osfamily => osfamily,
        }}

        it { should contain_class('dotfiles::params') }

        it { should contain_class('dotfiles::install::tools') }
        it { should contain_class('dotfiles::install::pyenv') }
        it { should contain_class('dotfiles::install::rbenv') }

        it { should contain_user('got')
            .with_ensure('present')
            .with_managehome(true)
        }
      end
    end
  end
end
