# frozen_string_literal: true

nodenv_user node['dotfiles']['user']

%w[14.18.2 16.13.1].each do |version|
  nodenv_install version do
    user node['dotfiles']['user']
  end
end

nodenv_global '16.13.1' do
  user node['dotfiles']['user']
end
