require 'spec_helper'
require 'rubyquest/cli'

module Rubyquest

  describe CLI do

    context "when starting a game" do

      before do
        @output = double.as_null_object
        @input = double.as_null_object
        @cli = CLI.new @input, @output
        hero = double('hero', :name => 'Tas')
        Hero.stub(:find).and_return(false, hero) # Runs the loop twice 
        @cli.stub(:console)
      end

      it "shows a greeting message" do
        @output.should_receive(:message).with("Greeting stranger, welcome to Rubyquest! May I have your name?", :announce)
        @cli.start!
      end

      it "shows a prompt message for choosing a hero and for giving commands" do
        @input.should_receive(:readline).with("Rubyquest ~> ").twice
        @cli.start!
      end

      context "when an Hero name is provided" do
        it "creates a Hero" do
          @input.stub(:readline).and_return('Caramon')
          Hero.should_receive(:find).with('Caramon')
          @cli.start!
        end

        it "greetings the Hero" do
          @output.should_receive(:message).with("Nice to meet you Tas. Type 'help' to see the available commands.", :announce)
          @cli.start!
        end
      end

      context "when an empty Hero name is passed" do
        it "complains about a empty Hero name" do
          @output.should_receive(:message).with("C'mon give me your name!", :announce)
          @cli.start!
        end
      end
    end

    context "when receives commands" do

      before do
        @output = double.as_null_object
        @input = double.as_null_object
        Command.stub(:new)
        @cli = CLI.new @input, @output
        @cli.stub(:set_user)
        @input.stub(:readline).and_return('go to castle', 'exit') # Runs the loop twice
      end

      it "loads the console" do
        @cli.should_receive(:console)
        @cli.start!
      end

      it "saves the command on the history" do
        @cli.start!
        Readline::HISTORY.should include 'go to castle'
      end

      it "invoks the command" do
        hero = double('hero')
        @cli.stub(:hero).and_return(hero)
        @input.stub(:readline).and_return('go to castle', 'exit')
        Command.should_receive(:new).with('go to castle', hero)
        @cli.start!
      end

    end

  end
end
