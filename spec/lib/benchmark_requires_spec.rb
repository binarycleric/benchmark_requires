require 'benchmark_requires'

describe BenchmarkRequires do

  before(:each) do
    described_class.initialize! Logger.new(nil)
  end

  describe "#benchmark" do

    it "log level balances after benchmark" do
      described_class.level.should eql 0
      described_class.benchmark('test') do
        # nothing
      end
      described_class.level.should eql 0
    end

    it "log level should be initial + 1 while benchmarking" do
      described_class.benchmark('test') do
        described_class.level.should eql 1
      end
    end

  end

end

