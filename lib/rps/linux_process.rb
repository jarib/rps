module RPS
  class LinuxProcess
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

    def command_line
      @command_line ||= File.read(cmdline_path).split("\000")
    end

    private

    def exe_path
      File.join(@dir, "exe")
    end

    def cmdline_path
      File.join(@dir, "cmdline")
    end
  end # LinuxProcess
end # RPS