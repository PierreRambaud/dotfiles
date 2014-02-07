require 'spec_helper'

describe 'dotfiles::config::fluxbox' do
  context 'supported operating systems' do
    ['Debian'].each do |osfamily|
      describe "dotfiles class without any parameters on #{osfamily}" do
        let(:params) {{ }}
        let(:facts) {{
          :osfamily => osfamily,
        }}

        it { should compile.with_all_deps }

        it { should contain_class('dotfiles::params') }
        it { should contain_file('fluxbox/init')
          .with_ensure('present')
          .with_owner('got')
          .with_group('got')
        }

        it { should contain_file('fluxbox/lastwallpaper')
          .with_ensure('present')
          .with_owner('got')
          .with_group('got')
        }

        it { should contain_file('.fluxbox')
          .with_ensure('directory')
          .with_owner('got')
          .with_group('got')
          .with_recurse('true')
        }

      end
    end
  end
end
