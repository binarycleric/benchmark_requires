require "benchmark"
require "logger"

module BenchmarkRequires

  class << self

    attr_accessor :logger, :level, :log_buffer

    ##
    # Don't monkey patch Object until we're absolutely sure.
    def initialize!(logger=nil)
      require "benchmark_requires/object_extension"

      if logger.nil?
        logger = Logger.new(STDOUT)
        logger.formatter = proc do |severity, datetime, progname, msg|
           "#{msg}\n"
        end
      end

      self.level = 0
      self.logger = logger 
    end

    def benchmark file_name, &block
      increment_level!
      time = Benchmark.realtime do
        yield
      end

      buffer_log build_log_message(file_name, time)
      decrement_level!
      flush_log_buffer if top_level? 
    end

    private

    def increment_level!
      self.level += 1
    end

    def decrement_level!
      self.level -= 1
    end

    def top_level?
      self.level == 0
    end

    def build_log_message file_name, time
      preamble = (self.level - 1).times.map{|n| "  "}.join("") 
      "#{preamble} -> #{colorize_file_name file_name} " + 
        "took #{colorize_time time.round(5)} seconds."
    end

    def buffer_log message
      self.log_buffer ||= []
      self.log_buffer << message 
    end

    def flush_log_buffer
      self.log_buffer.reverse.each do |msg|
        self.logger.debug msg
      end
      self.logger.debug ""

      self.log_buffer = []
    end

    def colorize_file_name file_name
      "\e[1;37m#{file_name}\e[0m"
    end

    def colorize_time time
      color = if time <= 0.01 # green
        "\e[0;32m"
      elsif time <= 0.25 # yellow
        "\e[1;33m"
      elsif time <= 0.75 # red
        "\e[1;31m"
      else # OMFG RED!!!!
        "\e[0;31m"
      end
 
      color + ("%f" % time) + "\e[0m"
    end

  end

end
