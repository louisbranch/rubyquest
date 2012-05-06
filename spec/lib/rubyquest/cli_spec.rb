require 'spec_helper'
require 'rubyquest/cli'

module Rubyquest

  describe CLI do


    let(:cli) { CLI.new }

    context "when start the console" do

      before do
        Readline.stub(:readline).and_return('exit') # Runs the loop just once
      end

      it "shows a greeting message" do
        Output.should_receive(:display).with("Welcome to Rubyquest! Type 'help' to see the available commands.")
        cli.start
      end

      it "shows a prompt message" do
        Readline.should_receive(:readline).with("Rubyquest ~> ")
        cli.start
      end

    end

    context "when receiving commands" do

      before do
        Readline.stub(:readline).and_return('help', 'exit') # Runs the loop twice
      end

      it "saves a command on the history" do
        cli.start
        Readline::HISTORY.should include 'help'
      end

      it "invokes a command" do
        Command.should_receive(:new).with('help')
        cli.start
      end

    end

  end
end
