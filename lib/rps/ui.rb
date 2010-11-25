module RPS
  class UI

    def initialize(io = $stdout)
      @io = io
    end

    def render(process)
      string = format_string % [ process.pid,
                                 process.exe,
                                 process.command_line.join(' ') ]

      @io << string
    end

    def format_string
      "%d [%s] %s\n"
    end
  end # RPS
end # UI