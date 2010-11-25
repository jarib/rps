require 'spec_helper'

module RPS
  describe CLI do
    it "creates a default runner" do
      runner = mock(Runner)

      Runner.should_receive(:new).and_return(runner)
      runner.should_receive(:ui=).with(instance_of(UI))
      runner.should_receive(:run)

      CLI.new.run
    end

    it "takes an optional arguments list" do
      CLI.new.should be_instance_of(CLI)
      CLI.new(["foo", "bar"]).should be_instance_of(CLI)
    end
  end
end