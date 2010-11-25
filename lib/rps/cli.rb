module RPS
  class CLI

    def initialize(args = nil)
      @runner = Runner.new
      @runner.ui = UI.new
    end

    def run
      @runner.run
    end

  end # CLI
end # RPS