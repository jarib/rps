require "spec_helper"

module RPS
  describe UI do
    let(:io)     { StringIO.new }
    let(:ui)     { UI.new(io) }

    it "renders the given proc" do
      pe = mock(ProcessEntry,
        :exe          => "/usr/bin/ruby1.8",
        :pid          => 123,
        :command_line => %w[ruby -e sleep]
      )

      ui.render pe
      io.string.should == "123 [/usr/bin/ruby1.8] ruby -e sleep\n"
    end

  end
end