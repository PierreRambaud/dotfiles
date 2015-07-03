# -*- coding: utf-8 -*-

execute 'restart-fluxbox' do
  command 'fluxbox-remote "Restart"'
  path %w(/usr/bin /bin)
  returns [0, 1]
  action :run
end
