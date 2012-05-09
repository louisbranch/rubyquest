require 'spec_helper'
require 'rubyquest/command'

module Rubyquest

  describe Command do

    it "reports invalid commands" do
      Output.should_receive(:display).with("'foobar' is not a valid command. Type 'help' to see all available commands.")
      Command.new 'foobar'
    end

    it "shows all commands" do
      Command.any_instance.stub(:list).and_return(['help', 'exit'])
      Output.should_receive(:display).with('Commands: help, exit')
      Command.new 'help'
    end

    it "ignores exit commands" do
      Output.should_not_receive(:display)
      Command.new 'exit'
    end

    it "shows all quests" do
      Quest.should_receive(:list)
      Command.new 'quests'
    end

    it "joins a quest" do
      Quest.should_receive(:join).with('1')
      Command.new 'join quest 1'
    end

    it "shows all heroes" do
      Hero.should_receive(:list)
      Command.new 'heroes'
    end

    it "loads a hero" do
      Hero.should_receive(:load).with('Caramon')
      Command.new 'hero Caramon'
    end

    it "creates a hero" do
      Hero.should_receive(:create).with('Caramon')
      Command.new 'new hero Caramon'
    end

    it "goes to a place" do
      map = double('map')
      hero = double('hero', :map => map )
      map.should_receive(:travel).with('forest')
      command = Command.new 'go to forest', hero
    end

  end
end
