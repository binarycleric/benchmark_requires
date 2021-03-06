require "benchmark"
require "logger"
require "benchmark_requires/message_builder"
require "benchmark_requires/runner"

module BenchmarkRequires

  class << self
    attr_accessor :logger, :log_action, :setup, :runner

    def benchmark file_name, &block
      setup! unless setup?
      self.runner.benchmark file_name, &block
    end

    def log message
      self.log_action.call self.logger, message
    end

    def setup!
      require "benchmark_requires/object_extension"

      unless self.logger
        self.logger = Logger.new(STDOUT).tap do |l|
          l.formatter = lambda do |severity, datetime, progname, message|
             "#{message}\n"
          end
        end
      end

      unless self.log_action
        self.log_action = lambda do |logger, message|
          logger.debug message
        end
      end

      self.setup = true
    end

    def setup?
      self.setup == true
    end

  end

  self.setup = false
  self.runner = Runner.new

end
