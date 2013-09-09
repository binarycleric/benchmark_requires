module BenchmarkRequires

  VERSION = "1.0.0"

  SUMMARY = "BenchmarkRequires is a simple gem that helps identify slow loading libraries."

  DESCRIPTION = <<-EOF
#{SUMMARY}

As applications get older and more complex the start-up time tends to increase 
quite dramatically. BenchmarkRequires helps by logging all requires/load and 
load times.

Idea inspired by http://nationbuilder.com/blistering_rails_performance_part_1_boot_performance
EOF

end
