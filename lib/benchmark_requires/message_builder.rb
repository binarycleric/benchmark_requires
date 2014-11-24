module BenchmarkRequires

  class MessageBuilder

    COLOR_WHITE = "\e[1;37m".freeze 
    COLOR_GREEN = "\e[0;32m".freeze
    COLOR_YELLOW = "\e[1;33m".freeze
    COLOR_RED = "\e[1;31m".freeze
    COLOR_OMFG_RED = "\e[0;31m".freeze
    COLOR_RESET = "\e[0m".freeze 

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
      "#{COLOR_WHITE}#{@file_name}#{COLOR_RESET}"
    end

    def colorize_time
      color = if @time <= 0.01
        COLOR_GREEN 
      elsif @time <= 0.25
        COLOR_YELLOW
      elsif @time <= 0.75
        COLOR_RED
      else 
        COLOR_OMFG_RED
      end
 
      color + ("%f" % @time) + COLOR_RESET 
    end

  end

end
