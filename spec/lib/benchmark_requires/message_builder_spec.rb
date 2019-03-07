require 'benchmark_requires'

describe BenchmarkRequires::MessageBuilder do

  it "rounds times to 6 decimal places" do
    time = 0.000001
    builder = described_class.new('test.rb', time)

    expect(builder.message(1)).to match /0\.000000/
  end

  it "includes file name" do
    builder = described_class.new('test.rb', 1.00)

    expect(builder.message(1)).to match /test\.rb/
  end

  it "indents based on level" do
    builder = described_class.new('test.rb', 1.00)

    expect(builder.message(1)).to match /^ \-\> /
    expect(builder.message(2)).to match /^(   \-\> )/
    expect(builder.message(3)).to match /^(     \-\> )/
  end

end
