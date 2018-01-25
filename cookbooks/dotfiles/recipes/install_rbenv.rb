# frozen_string_literal: true

rbenv_user_install node['dotfiles']['user']

rbenv_plugin 'ruby-build' do
  git_url 'https://github.com/rbenv/ruby-build.git'
  user node['dotfiles']['user']
end
