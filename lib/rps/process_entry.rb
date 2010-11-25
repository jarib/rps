module RPS
  class ProcessEntry
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

    private

    def exe_path
      @exe_path ||= File.join(@dir, "exe")
    end
  end # ProcessEntry
end # RPS