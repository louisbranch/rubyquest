require 'spec_helper'
require 'rubyquest/command'

module Rubyquest

  describe Command do

    let(:output) { double('output')}

    it "reports invalid commands" do
      output.should_receive(:action).with("'foobar' is not a valid command. Type 'help' to see all available commands.")
      Command.new 'foobar', nil, output
    end

    it "shows all the available commands" do
      output.should_receive(:action).with('Commands: go to <place>, help, exit')
      Command.new 'help', nil, output
    end

    it "ignores exit commands" do
      output.should_not_receive(:action)
      Command.new 'exit', nil, output
    end

    it "goes to a place" do
      map = double('map')
      hero = double('hero', :map => map )
      map.should_receive(:travel).with('forest')
      command = Command.new 'go to forest', hero
    end

  end
end
