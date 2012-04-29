require 'spec_helper'
require 'ruby_quest/command'

module RubyQuest

  describe Command do

    let(:output) { output = double('output') }
    let(:command) { command = Command.new(output) }

    context "when going to a new location" do

      let(:forest) { double('new_location', :name => 'forest')}
      let(:map) { double('map')}

      it "informs that the location has been reached" do
        map.should_receive(:travel).and_return(true)
        output.should_receive(:react).with("You have reached the forest")
        command.go forest, map
      end

      it "informs that this location is unavailable" do
        map.should_receive(:travel).and_return(false)
        output.should_receive(:react).with("Forest is not on your map. Type 'map' to list all avaiable locations")
        command.go forest, map
      end

    end
  end
end
