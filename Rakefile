# -*- coding: utf-8 -*-
def run_command(command)
  if File.exist?('Gemfile.lock')
    sh %(bundle exec #{command})
  else
    sh %(chef exec #{command})
  end
end

task :vendor do
  rm_rf('berks-coobkooks')
  rm_rf('Berksfile.lock')
  run_command('berks vendor')
end

namespace :test do
  desc 'Tests suites runner'

  task :foodcritic do
    run_command('foodcritic -f any .')
  end

  task :rubocop do
    run_command(:rubocop)
  end

  task :kitchen do
    run_command('kitchen test')
  end
end

namespace :converge do
  desc 'Converge dotfiles'
  task :home do
    run_command("chef-client -z -o 'role[home]'")
  end

  task :work do
    run_command("chef-client -z -o 'role[work]'")
  end
end

task default: ['test:foodcritic', 'test:rubocop']
