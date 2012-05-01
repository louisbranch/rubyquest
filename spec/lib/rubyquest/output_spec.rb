require 'spec_helper'
require 'rubyquest/output'

module Rubyquest

  describe Output do

    let(:output) { Output.new }

    it "prints a announcement from the game" do
      output.should_receive(:puts).with('** Let the game begin! **')
      output.announce('Let the game begin!')
    end

    it "prints the result of an action" do
      output.should_receive(:puts).with('I want to play a game with you!')
      output.action('I want to play a game with you!')
    end

  end

end
