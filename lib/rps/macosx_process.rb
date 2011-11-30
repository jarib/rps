require 'ffi'

module RPS
  class MacOSXProcess
    module Lib
      extend FFI::Library
      ffi_lib FFI::CURRENT_PROCESS

      CTL_KERN      = 1
      KERN_PROC     = 14
      KERN_PROC_ALL = 0
      
      attach_function :sysctl, [:pointer, :uint, :pointer, :pointer, :pointer, :size_t], :int
    end
    
    
    def self.all
      raise NotImplementedError
      
      mib = [Lib::CTL_KERN, Lib::KERN_PROC, Lib::KERN_PROC_ALL, 0]
      mip = FFI::MemoryPointer.new(:int, mib.size).write_array_of_int(mib)
      
      # meh. struct too much for bsd.
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
  end # MacOSXProcess
end # RPS