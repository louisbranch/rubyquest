require 'spec_helper'
require 'ruby_quest/map'

module RubyQuest

  describe Map do

    let(:map) { Map.new }

    it "starts on limbo" do
      map.now.should eq 'limbo'
    end

    it "shows a list of locations"

    it "travels to a location" do
      map.travel 'forest'
      map.now.should eq 'forest'
    end

    it "doesn't travel to an invalid location"

    it "doesn't travel to the current location"

  end

end
