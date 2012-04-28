require 'spec_helper'
require 'ruby_quest/output'

module RubyQuest

  describe Output do

    it "prints a message to the user" do
      output = Output.new
      output.should_receive(:p).with('I want to play a game with you!')
      output.action('I want to play a game with you!')
    end

  end

end
