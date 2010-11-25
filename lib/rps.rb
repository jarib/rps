require "rbconfig"
require "rps/cli"
require "rps/runner"
require "rps/ui"

module RPS
  PLATFORMS = {
    :linux => "LinuxProcess"
  }

  def self.platform
    @os ||= (
      host_os = RbConfig::CONFIG['host_os']
      case host_os
      when /mswin|msys|mingw32/
        :windows
      when /darwin|mac os/
        :macosx
      when /linux/
        :linux
      when /bsd/
        :bsd
      when /solaris/
        :solaris
      else
        raise "unknown os: #{host_os.inspect}"
      end
    )
  end

  def self.check_platform
    unless PLATFORMS.has_key? platform
      abort platform_message
    end
  end

  def self.all
    clazz = PLATFORMS[os] or raise platform_message
    const_get(clazz).all
  end

  def self.platform_message
    "rps only works on #{SUPPORTED_PLATFORMS.inspect} at the moment"
  end

  autoload :LinuxProcess, "rps/linux_process"
  autoload :BsdProcess, "rps/bsd_process"
end
