require 'spec_helper'
require 'rubyquest/map'

module Rubyquest

  describe Map do

    let(:map) { Map.new }
    let(:forest) { double('forest', :name => 'forest')}

    it "shows a list of places" do
      map.add forest
      Output.should_receive(:display).with('1. forest')
      map.list
    end

    context "when traveling to a place" do

      it "checks if the place exists"

      it "checks if the place is available on the map" do
        map.should_receive(:on_map?).with(forest)
        map.travel forest
      end

      it "informs that the places are the same" do
        map.stub(:current).and_return(forest)
        Output.should_receive(:display).with("You already are in forest")
        map.travel forest
      end

      context "when the place in on the map" do
        it "updates the current place" do
          map.add forest
          map.travel forest
          map.current.should eq forest
        end

        it "informs that the place has been reached" do
          map.stub(:on_map?).and_return(true)
          Output.should_receive(:display).with("You have reached the forest")
          map.travel forest
        end

      end

      context "when the place is not on the map" do
        it "doesn't update the current place" do
          map.travel forest
          map.current.should_not eq forest
        end

        it "informs that the place is not on the map" do
          Output.should_receive(:display).with("Forest is not on your map. Type 'map' to list all available places")
          map.travel forest
        end
      end

    end
  end
end
