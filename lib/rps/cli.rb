module RPS
  class CLI

    def initialize(args = [])
      opts = {}

      if args.include? "--cwd"
        opts[:cwd] = true
      end

      ui = UI.new(STDOUT, opts)

      @runner = Runner.new ui
    end

    def run
      @runner.run
    end

  end # CLI
end # RPS