# frozen_string_literal: true

pyenv_user_install node['dotfiles']['user']

pyenv_plugin 'virtualenv' do
  git_url 'https://github.com/yyuu/pyenv-virtualenv'
  user node['dotfiles']['user']
end
