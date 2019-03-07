require 'benchmark_requires'

describe BenchmarkRequires do

  before(:each) do
    described_class.logger = Logger.new(nil)
  end

  context "post-setup" do

    before(:each) do
      described_class.setup!
    end

    it "reports as being setup" do
      expect(described_class.setup?).to be_truthy
    end

    it "sets up sane defaults" do
      logger = described_class.logger

      expect(logger).to be
      expect(logger).to respond_to :debug

      log_action = described_class.log_action
      expect(log_action).to be_a Proc

      expect(logger).to receive(:debug).with("test123")
      log_action.call(logger, "test123")
    end

    describe "#log" do

      it "uses logger and log_action" do
        logger = described_class.logger
        log_action = described_class.log_action
        message = "test123"

        expect(logger).to receive(:debug).with(message)

        described_class.log message
      end

    end

  end

end

