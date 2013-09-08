benchmark_requires
==================

A simple to gem to benchmark your application's loads and requires.

## Usage

To use benchmark_requires simply require and initialize the library as early in
your application's loading process as possible.

```ruby
require 'benchmark_requires'

BenchmarkRequires.initialize!

# now load the rest of your app
```

Now startup your application and keep an eye on STDOUT (don't worry, you can
change this too).

## Using A Custom Logger

By default benchmark_requires uses `Logger` to log all requires and loads. To
change the logger class simply pass in an instance of the logger you'd like to
use. 

```ruby
require 'benchmark_requires'

BenchmarkRequires.initialize!(Rails.logger)
BenchmarkRequires.initialize!(Logger.new(STDERR))
BenchmarkRequires.initialize!(Logger.new(nil))
# etc, etc, etc
```

## TODOs

* More tests. 
* Better support for custom loggers.
* More Documentation.
