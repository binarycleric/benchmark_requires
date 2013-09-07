Bundler::GemHelper.install_tasks

require 'rspec/core'
require 'rspec/core/rake_task'

desc "Run all specs in spec directory"
RSpec::Core::RakeTask.new(:test) 

task :default => [:test]
