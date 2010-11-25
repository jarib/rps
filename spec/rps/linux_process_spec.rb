require "spec_helper"

module RPS
  describe LinuxProcess do
    it "creates a process for each process in /proc" do
      Dir.stub!(:[]).with("/proc/*").and_return(["/proc/1", "/proc/2", "/proc/3", "/proc/uptime"])

      procs = LinuxProcess.all

      procs.should be_instance_of(Array)
      procs.size.should == 3
      procs.each { |proc| proc.should be_instance_of(LinuxProcess) }
    end

    it "returns the pid" do
      LinuxProcess.new("/proc/123").pid.should == 123
    end

    it "returns the executable path" do
      File.stub!(:readlink).with("/proc/1/exe").and_return("/some/executable")
      LinuxProcess.new("/proc/1").exe.should == "/some/executable"
    end

    it "returns the command line" do
      File.stub!(:read).with("/proc/1/cmdline").and_return("ruby\000-e\000sleep\000")
      LinuxProcess.new("/proc/1").command_line.should == ["ruby", "-e", "sleep"]
    end

    it "knows if the process is a ruby process" do
      pe = LinuxProcess.new("/proc/1")
      pe.stub!(:exe).and_return "/path/to/ruby"

      pe.should be_ruby
    end

    it "knows if the process is not a ruby process" do
      pe = LinuxProcess.new("/proc/1")
      pe.stub!(:exe).and_return "/path/to/something else"

      pe.should_not be_ruby
    end

    it "knows if the process is readable" do
      File.should_receive(:readable?).
           with("/proc/1/exe").
           and_return(true)

      pe = LinuxProcess.new("/proc/1")
      pe.should be_readable
    end

    it "knows if the process isn't readable" do
      File.should_receive(:readable?).
           with("/proc/1/exe").
           and_return(false)

      pe = LinuxProcess.new("/proc/1")
      pe.should_not be_readable
    end

  end
end
