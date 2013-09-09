require "benchmark_requires"

describe BenchmarkRequires::Runner do

  before(:each) do
    BenchmarkRequires.setup!
    BenchmarkRequires.logger = Logger.new nil
  end

  it "flushes buffer log after benchmark" do
    BenchmarkRequires.should_receive(:log).twice

    runner = described_class.new
    runner.benchmark('test.rb') do
      # nothing.
    end
  end

  it "returns to top level after benchmark is complete" do
    runner = described_class.new
    runner.benchmark('test.rb') do
      # nothing.
    end

    runner.send(:top_level?).should be_true
  end

end
