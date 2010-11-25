module RPS
  class CLI

    def initialize(args = nil)
      @runner = Runner.new
    end

    def run
      @runner.ui ||= UI.new
      @runner.run
    end

  end # CLI
end # RPS