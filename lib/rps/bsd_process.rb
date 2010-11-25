module RPS
  class BsdProcess
    def self.all
      raise NotImplementedError
    end

    def readable?
      raise NotImplementedError
    end

    def ruby?
      raise NotImplementedError
    end

    def exe
      raise NotImplementedError
    end

    def pid
      raise NotImplementedError
    end

    def command_line
      raise NotImplementedError
    end

  end # BsdProcess
end # RPS