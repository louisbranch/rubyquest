require 'spec_helper'
require 'ruby_quest/command'

module RubyQuest

  describe Command do

    context "when going to a new location" do

      let(:forest) { double('new_location', :name => 'forest')}

      it "informs that the location has been reached" do
        output = double('output')
        command = Command.new(output)
        map = double("map", :travel => true)
        output.should_receive(:react).with("You have reached the forest")
        command.go forest, map
      end

      it "informs that this location is unavailable" do
        output = double('output')
        command = Command.new(output)
        map = double("map", :travel => false)
        output.should_receive(:react).with("Forest is not on your map. Type 'map' to list all avaiable locations")
        command.go forest, map
      end

    end
  end
end
