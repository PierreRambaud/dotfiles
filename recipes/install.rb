user node['dotfiles']['user'] do
  supports :manage_home => true
  shell '/bin/bash'
  action :modify
end


node['dotfiles']['packages'].each do |item|
  package item do
    action :install
  end
end
