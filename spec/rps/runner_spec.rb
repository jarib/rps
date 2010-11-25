require "spec_helper"

module RPS
  describe Runner do
    let(:ui)     { mock(UI)   }
    let(:runner) { Runner.new(ui) }

    it "fetches the process list" do
      RPS.should_receive(:all).and_return([])
      runner.run
    end

    it "shows each readable ruby process on the UI" do
      procs = [
        mock(:ruby? => true, :readable? => true),
        mock(:ruby? => false, :readable? => true),
        mock(:ruby? => true, :readable? => false),
        mock(:ruby? => true, :readable? => true)
      ]

      RPS.should_receive(:all).and_return(procs)

      ui.should_receive(:render).once.with(procs.first)
      ui.should_receive(:render).once.with(procs.last)

      runner.run
    end
  end
end