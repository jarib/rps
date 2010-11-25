require "spec_helper"

module RPS
  describe Runner do
    let(:ui)     { mock(UI)   }
    let(:runner) { Runner.new(ui) }

    it "fetches the process list" do
      ProcessEntry.should_receive(:all).and_return([])
      runner.run
    end

    it "shows each ruby process on the UI" do
      procs = [
        mock(ProcessEntry, :ruby? => true),
        mock(ProcessEntry, :ruby? => false),
        mock(ProcessEntry, :ruby? => true)
      ]
      ProcessEntry.should_receive(:all).and_return(procs)

      ui.should_receive(:render).once.with(procs.first)
      ui.should_receive(:render).once.with(procs.last)

      runner.run
    end
  end
end