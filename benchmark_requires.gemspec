$:.push File.expand_path("../lib", __FILE__)

require "benchmark_requires/version"

Gem::Specification.new do |s|
  s.name = "benchmark_requires"
  s.version = BenchmarkRequires::VERSION 
  s.date = "2013-09-07"
  s.summary = "gem to benchmark requires and loads"
  s.description = "Idea inspired by http://nationbuilder.com/blistering_rails_performance_part_1_boot_performance"
  s.homepage = "http://www.github.com/binarycleric/benchmark_requires"
  s.authors = ["Jon Daniel"]
  s.email = "binarycleric@gmail.com"
  s.license = "MIT"

  s.files = Dir["lib/**/*"] + ["LICENSE", "README.md"]
  s.test_files = Dir["spec/**/*"]

  s.add_development_dependency "rake"
  s.add_development_dependency "rspec"
end
