require 'spec_helper'
require 'ruby_quest/map'

module RubyQuest

  describe Map do

    let(:output) { double.as_null_object } # Ignored unexpected messages
    let(:map) { Map.new(output) }

    it "shows a list of locations"

    context "when travelling to a location" do
      let(:forest) { double('forest', :name => 'forest')}

      it "informs that the locations are the same" do
        map.stub(:current).and_return(forest)
        output.should_receive(:action).with("You already are in forest")
        map.travel forest
      end

      it "checks if a location is available on the map" do
        map.should_receive(:on_map?).with(forest)
        map.travel forest
      end

      context "if the location in on the map" do
        it "updates the current location" do
          map.stub(:on_map?).and_return(true)
          map.travel forest
          map.current.should eq forest
        end

        it "informs that the location has been reached" do
          map.stub(:on_map?).and_return(true)
          output.should_receive(:action).with("You have reached the forest")
          map.travel forest
        end

        it "triggers the location description"
      end

      context "if the location is not on the map" do
        it "doesn't update the current location" do
          map.stub(:on_map?).and_return(false)
          map.travel forest
          map.current.should_not eq forest
        end

        it "informs that the location is not on the map" do
          map.stub(:on_map?).and_return(false)
          output.should_receive(:action).with("Forest is not on your map. Type 'map' to list all avaiable locations")
          map.travel forest
        end
      end

    end
  end
end
