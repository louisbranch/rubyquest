require 'spec_helper'
require 'rubyquest/cli'

module Rubyquest

  describe CLI do

    before do
      Readline.stub(:readline).and_return('help', 'exit') # Runs the loop twice
    end

    let(:cli) { CLI.new }

    it "shows a prompt message" do
      Readline.should_receive(:readline).with("Rubyquest ~> ")
      cli.start!
    end

    it "saves a command on the history" do
      cli.start!
      Readline::HISTORY.should include 'help'
    end

    it "invokes a command" do
      Command.should_receive(:new).with('help')
      cli.start!
    end

  end
end
