require "spec_helper"

module RPS
  describe ProcessEntry do
    it "creates a process for each process in /proc" do
      Dir.stub!(:[]).with("/proc/*").and_return(["/proc/1", "/proc/2", "/proc/3", "/proc/uptime"])
      
      procs = ProcessEntry.all
      
      procs.should be_instance_of(Array)
      procs.size.should == 3
      procs.each { |proc| proc.should be_instance_of(ProcessEntry) }
    end
    
    it "returns the pid" do
      ProcessEntry.new("/proc/123").pid.should == 123
    end
    
    it "returns the executable path" do
      File.stub!(:readlink).with("/proc/1/exe").and_return("/some/executable")
      ProcessEntry.new("/proc/1").exe.should == "/some/executable"
    end
    
    it "knows if the process is a ruby process" do
      pe = ProcessEntry.new("/proc/1")
      pe.stub!(:exe).and_return "/path/to/ruby"
      
      pe.should be_ruby
    end

    it "knows if the process is not a ruby process" do
      pe = ProcessEntry.new("/proc/1")
      pe.stub!(:exe).and_return "/path/to/something else"
      
      pe.should_not be_ruby
    end
  end
end