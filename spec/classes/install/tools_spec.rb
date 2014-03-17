require 'spec_helper'

describe 'dotfiles::install::tools' do
  context 'supported operating systems' do
    ['Debian'].each do |osfamily|
      describe "dotfiles::install::tools class without any parameters on #{osfamily}" do
        let(:params) {{ }}
        let(:facts) {{
          :osfamily => osfamily,
        }}

        it { should compile.with_all_deps }

        it { should contain_exec('cask')
            .with_command('git clone https://github.com/cask/cask.git')
            .with_creates('/home/got/.cask')
        }

        it { should contain_file('/home/got/.cask')
            .with_ensure('directory')
            .with_owner('got')
            .with_group('got')
        }
      end
    end
  end
end
