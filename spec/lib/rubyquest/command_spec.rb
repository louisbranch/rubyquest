require 'spec_helper'
require 'rubyquest/command'

module Rubyquest

  describe Command do

    it "reports invalid commands" do
      Output.should_receive(:display).with("'foobar' is not a valid command. Type 'help' to see all available commands.")
      Command.new 'foobar'
    end

    it "shows all commands" do
      Output.should_receive(:display).with('Commands: help, exit')
      Command.new 'help'
    end

    it "ignores exit commands" do
      Output.should_not_receive(:display)
      Command.new 'exit'
    end

    it "shows all quests" do
      Quest.should_receive(:load)
      Command.new 'quests'
    end

    it "creates a hero" do
      Hero.should_receive(:find).with('Caramon')
      Command.new 'create hero Caramon'
    end

    it "goes to a place" do
      map = double('map')
      hero = double('hero', :map => map )
      map.should_receive(:travel).with('forest')
      command = Command.new 'go to forest', hero
    end

  end
end
