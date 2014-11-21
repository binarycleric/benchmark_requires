Bundler::GemHelper.install_tasks

require 'rspec/core'
require 'rspec/core/rake_task'

desc "Run all specs in spec directory"
RSpec::Core::RakeTask.new(:test) 

task :default => [:test]


task :example do 
  require 'benchmark_requires'

  BenchmarkRequires.logger = Logger.new STDERR
  BenchmarkRequires.log_action = lambda do |logger, message|
    logger.info message
  end

  BenchmarkRequires.setup!

  require 'json'
  require 'time'
  require 'benchmark'
  require 'logger'
end
