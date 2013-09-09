require 'benchmark_requires'

describe BenchmarkRequires::MessageBuilder do

  it "rounds times to 6 decimal places" do
    time = 0.000001
    builder = described_class.new('test.rb', time)
    builder.message(1).should match /0\.000000/
  end

  it "includes file name" do
    builder = described_class.new('test.rb', 1.00)
    builder.message(1).should match /test\.rb/ 
  end

  it "indents based on level" do
    builder = described_class.new('test.rb', 1.00)
    builder.message(1).should match /^ \-\> / 
    builder.message(2).should match /^(   \-\> )/ 
    builder.message(3).should match /^(     \-\> )/ 
  end

end
