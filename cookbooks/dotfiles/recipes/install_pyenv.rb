# frozen_string_literal: true

pyenv_global '3.6.1' do
  user node['dotfiles']['user']
end

git 'install-pyenv-virtual-env' do
  destination "#{node['dotfiles']['user_home']}/.pyenv/plugins/pyenv-virtualenv"
  repository 'https://github.com/yyuu/pyenv-virtualenv.git'
  user node['dotfiles']['user']
  group node['dotfiles']['user']
  timeout 9000
  action :sync
end
