require 'spec_helper'

describe 'dotfiles::install::pyenv' do
  context 'supported operating systems' do
    ['Debian'].each do |osfamily|
      describe "dotfiles::install::pyenv class without any parameters on #{osfamily}" do
        let(:params) {{ }}
        let(:facts) {{
          :osfamily => osfamily,
        }}

        it { should contain_class('dotfiles::params') }

        it { should contain_pyenv__compile('3.3.2')
            .with_user('got')
            .with_python('3.3.2')
        }

        it { should contain_pyenv__compile('2.7.5')
            .with_user('got')
            .with_python('2.7.5')
            .with_global(true)
        }

        it { should contain_pip('2.7.5 tools')
            .with_ensure('installed')
            .with_package('yoda')
            .with_user('got')
            .with_python_version('2.7.5')
        }

        it { should contain_pip('3.3.2 tools')
            .with_ensure('installed')
            .with_package('["yoda", "usblamp", "groove-dl"]')
            .with_user('got')
            .with_python_version('3.3.2')
        }
      end
    end
  end
end
