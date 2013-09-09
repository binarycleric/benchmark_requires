benchmark_requires
==================

BenchmarkRequires is a simple gem that helps identify slow loading libraries.

As applications get older and more complex the start-up time tends to increase 
quite dramatically. BenchmarkRequires helps by logging all requires/load and 
load times.

Idea inspired by http://nationbuilder.com/blistering_rails_performance_part_1_boot_performance"

## Usage

To use benchmark_requires simply require and initialize the library as early in
your application's loading process as possible. All necessary configuration will 
be handled "just in time" when the first require/load is benchmarked.

```ruby
require 'benchmark_requires'
BenchmarkRequires.setup!

# now load the rest of your app
```

Startup your application and keep an eye on STDOUT (don't worry, you can
change this too).

## Using a Custom Logger and Log Action

By default benchmark_requires uses `Logger` and all logged actions will be sent
to `:debug`. Changing these defaults is easy. 
 
```ruby
require 'benchmark_requires'

BenchmarkRequires.logger = Rails.logger
BenchmarkRequires.logger = Logger.new STDERR
BenchmarkRequires.logger = Logger.new nil

BenchmarkRequires.log_action = proc do |logger, message|
  logger.info message
end

# super basic log action.
BenchmarkRequires.log_action = proc do |logger, message|
  puts message
end

BenchmarkRequires.setup!
 
# etc, etc, etc
```

## TODOs

* More tests. 
* Better support for custom loggers.
* More Documentation.
