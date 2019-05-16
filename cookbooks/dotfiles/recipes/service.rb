# frozen_string_literal: true

execute 'restart-fluxbox' do
  command 'fluxbox-remote "Restart"'
  environment 'PATH' => "/bin:/usr/bin:#{ENV['PATH']}"
  returns [0, 1]
  ignore_failure true
  action :run
end
