require 'spec_helper'
require 'ruby_quest/cli'

module RubyQuest

  describe CLI do

    let(:input) { double.as_null_object } # Ignored unexpected messages
    let(:output) { double.as_null_object }
    let(:cli) { CLI.new input, output }

    it "shows a greeting message" do
      output.should_receive(:announce).with("Greeting stranger, welcome to RubyQuest! May I have your name?")
      cli.stub(:console) # Prevent the deadly loop
      cli.start!
    end

    it "loads the console" do
      cli.should_receive(:console)
      cli.start!
    end

    it "created an endless loop" do
      console = double('console')
      cli.stub(:console).and_return(console)
      console.stub(:command).with("ex", "mex", "dex")

      cli.start!
    end

    it "shows a prompt message" do
      input.should_receive(:readline).with("RubyQuest ~> ")
      cli.stub(:console) # Prevent the deadly loop
      cli.start!
    end

  end
end
