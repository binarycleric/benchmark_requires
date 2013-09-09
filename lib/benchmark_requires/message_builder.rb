module BenchmarkRequires

  class MessageBuilder

    def initialize file_name, time
      @file_name = file_name
      @time = time.round 5
    end

    def message level 
      "#{preamble(level)} -> #{colorize_file_name} took #{colorize_time} seconds."
    end

    private

    def preamble level
      (level - 1).times.map{|n| "  "}.join("") 
    end

    def colorize_file_name
      "\e[1;37m#{@file_name}\e[0m"
    end

    def colorize_time
      color = if @time <= 0.01 # green
        "\e[0;32m"
      elsif @time <= 0.25 # yellow
        "\e[1;33m"
      elsif @time <= 0.75 # red
        "\e[1;31m"
      else # OMFG RED!!!!
        "\e[0;31m"
      end
 
      color + ("%f" % @time) + "\e[0m"
    end

  end

end
