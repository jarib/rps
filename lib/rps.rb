require "rbconfig"

module RPS
  def self.os
    @os ||= RbConfig::CONFIG['host_os']
  end

  def self.check_platform
    unless os =~ /linux/i
      abort "rps only works on linux at the moment"
    end
  end
end

require "rps/cli"
require "rps/runner"
require "rps/process_entry"
require "rps/ui"