module RPS
  class UI
    
    def initialize(io = $stdout)
      @io = io
    end
    
    def render(process)
      @io.puts format_string % [process.pid, process.exe]
    end
    
    def format_string
      "%d %s"
    end
  end # RPS
end # UI