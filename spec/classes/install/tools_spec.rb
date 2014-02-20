require 'spec_helper'

describe 'dotfiles::install::tools' do
  context 'supported operating systems' do
    ['Debian'].each do |osfamily|
      describe "dotfiles class without any parameters on #{osfamily}" do
        let(:params) {{ }}
        let(:facts) {{
          :osfamily => osfamily,
        }}

        it { should contain_exec('cask')
            .with_command('git clone https://github.com/cask/cask.git')
            .with_creates('/home/got/.cask')
            .with_require('User[got]')
        }

        it { should contain_file('/home/got/.cask')
            .with_ensure('directory')
            .with_owner('got')
            .with_group('got')
        }

        it { should contain_exec('pyenv')
            .with_command('git clone git://github.com/yyuu/pyenv.git .pyenv')
            .with_creates('/home/got/.pyenv')
            .with_require('User[got]')
        }

        it { should contain_file('/home/got/.pyenv')
            .with_ensure('directory')
            .with_owner('got')
            .with_group('got')
        }

        it { should contain_exec('rbenv')
            .with_command('curl https://raw.github.com/fesplugas/rbenv-installer/master/bin/rbenv-installer | bash')
            .with_creates('/home/got/.rbenv')
            .with_require('User[got]')
        }

        it { should contain_file('/home/got/.rbenv')
            .with_ensure('directory')
            .with_owner('got')
            .with_group('got')
        }
      end
    end
  end
end
