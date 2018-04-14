# frozen_string_literal: true

py_version = '3.6.1'

pyenv_python py_version do
  user node['dotfiles']['user']
end

pyenv_global py_version do
  user node['dotfiles']['user']
end

pyenv_plugin 'virtualenv' do
  git_url 'https://github.com/yyuu/pyenv-virtualenv'
  user node['dotfiles']['user']
end
