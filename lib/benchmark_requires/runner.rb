module BenchmarkRequires

  class Runner

    def initialize
      @level = 0
      @log_buffer = [] 
    end

    def benchmark(file_name, &block)
      increment_level!
      time = Benchmark.realtime do
        yield
      end

      buffer_log MessageBuilder.new(file_name, time).message(@level)
      decrement_level!
      flush_log_buffer if top_level? 
    end

    private

    def increment_level!
      @level += 1
    end

    def decrement_level!
      @level -= 1
    end

    def top_level?
      @level == 0
    end

    def buffer_log message
      @log_buffer << message 
    end

    def flush_log_buffer
      @log_buffer.reverse.each{|msg| BenchmarkRequires.log(msg)}
      BenchmarkRequires.log("")

      @log_buffer = []
    end

  end


end
