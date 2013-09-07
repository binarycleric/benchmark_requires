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

As your app is loading benchmark_requires will print to STDOUT (by default) the
file being loaded as well as the time it took to load.

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
