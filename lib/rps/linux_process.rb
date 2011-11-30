module RPS
  class LinuxProcess
    NULL = "\000"

    def self.all
      Dir['/proc/*'].map { |dir| new(dir) if File.basename(dir) =~ /^\d+$/ }.compact
    end

    def initialize(dir)
      @dir = dir
    end

    def readable?
      File.readable? exe_path
    end

    def ruby?
      exe.include? "ruby" # is this good enough?
    end

    def exe
      @exe ||= File.readlink(exe_path)
    end

    def pid
      @pid ||= Integer(File.basename(@dir))
    end

    def cwd
      @cwd ||= File.readlink(cwd_path)
    end

    def command_line
      @command_line ||= File.read(cmdline_path).split(NULL)
    end

    def environment
      @environment ||= (
        strings = File.read(environ_path).split(NULL)
        data = strings.map { |e| e.split("=") }

        Hash[data]
      )
    end

    private

    def exe_path
      File.join(@dir, "exe")
    end

    def cmdline_path
      File.join(@dir, "cmdline")
    end

    def environ_path
      File.join(@dir, "environ")
    end

    def cwd_path
      File.join(@dir, 'cwd')
    end
  end # LinuxProcess
end # RPS