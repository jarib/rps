require "spec_helper"

describe "RPS" do
  it "should include the current process" do
    RPS.all.find { |e| e.pid == Process.pid }.should be_ruby
  end
end