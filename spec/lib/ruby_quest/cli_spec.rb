require 'spec_helper'
require 'ruby_quest/cli'

module RubyQuest

  describe CLI do

    before do
      @input = double.as_null_object
      @output = double.as_null_object
      @cli = CLI.new @input, @output
      hero = double('hero', :name => 'Tas')
      Hero.stub(:new).and_return(false, hero) # Runs the loop twice 
      @cli.stub(:console)
    end

    it "shows a greeting message" do
      @output.should_receive(:announce).with("Greeting stranger, welcome to RubyQuest! May I have your name?")
      @cli.start!
    end

    it "shows a prompt message for choosing a hero and for giving commands" do
      @input.should_receive(:readline).with("RubyQuest ~> ").twice
      @cli.start!
    end

    context "when an Hero name is provided" do
      it "creates a Hero" do
        @input.stub(:readline).and_return('Caramon')
        Hero.should_receive(:new).with('Caramon')
        @cli.start!
      end

      it "greetings the Hero" do
        @output.should_receive(:announce).with("Nice to meet you Tas")
        @cli.start!
      end
    end

    context "when an empty Hero name is passed" do
      it "complains about a empty Hero name" do
        @output.should_receive(:announce).with("C'mon give me your name!")
        @cli.start!
      end
      it "doesn't load the console until a name is given"
    end

    it "loads the console" do
      @cli.should_receive(:console)
      @cli.start!
    end

    it "created an endless loop"


  end
end
