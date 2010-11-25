module RPS
  class ProcessEntry
    def self.all
      Dir['/proc/*'].map { |dir| new(dir) if File.basename(dir) =~ /^\d+$/ }.compact
    end

    def initialize(dir)
      @dir = dir
    end

    def readable?
      File.stat(@dir).uid == Process.uid || Process.uid == 0
    end

    def ruby?
      exe.include? "ruby" # is this good enough?
    end

    def exe
      @exe ||= File.readlink(path_to('exe'))
    end

    def pid
      @pid ||= Integer(File.basename(@dir))
    end

    private

    def path_to(file)
      File.join(@dir, file)
    end
  end # ProcessEntry
end # RPS