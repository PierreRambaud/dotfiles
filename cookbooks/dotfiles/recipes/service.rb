# -*- coding: utf-8 -*-

execute 'restart-fluxbox' do
  command 'fluxbox-remote "Restart"'
  environment 'PATH' => "/bin:/usr/bin:#{ENV['PATH']}"
  returns [0, 1]
  action :run
end
