module RPS
  class UI

    def initialize(io = $stdout, opts = {})
      @io = io
      @opts = opts
    end

    def render(process)
      string = []

      string << process.pid.to_s
      string << "[#{process.exe}]"
      string << process.command_line.join(' ')
      string << "cwd=#{process.cwd}" if @opts[:cwd]

      @io << string.join(' ') << "\n"
    end

  end # RPS
end # UI