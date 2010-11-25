module RPS
  class Runner
    attr_accessor :ui
    
    def initialize(ui = nil)
      @ui = ui
    end
    
    def run
      raise "no ui provided" unless ui
      procs.each { |proc| ui.render proc if proc.ruby?  }
    end
    
    private
    
    def procs
      @procs ||= ProcessEntry.all
    end
  end # Runner
end # RPS