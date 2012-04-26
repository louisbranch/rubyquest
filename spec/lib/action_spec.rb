require 'spec_helper'
require 'action'

module RubyQuest

  class Dummy
    include Action
  end

  class Output
    def self.action msg
    end
  end
  
  describe Action do

    let(:actor) { Dummy.new }

    context "when going to a new location" do

      let(:forest) { double('new_location', :name => 'forest')}

      context "and the location is on the map" do

        before do
          actor.stub(:on_map?).and_return(true)
        end

        it "travels to this location" do
          actor.go forest
          actor.location.should eq forest
        end

        it "informs that the location has been reached" do
          Output.should_receive(:action).with('You have reached the forest')
          actor.go forest
        end

      end

      context "and the location is not on the map" do

        let(:mountain) { double('old_location', :name => 'mountain')}

        it "doesn't travel to this location" do
          actor.location = mountain
          actor.go forest
          actor.location.should eq mountain
        end

        it "informs that this location is unavailable" do
          Output.should_receive(:action).with("You don't have forest on your map. Type 'map' to see the available locations")
          actor.go forest
        end

      end

    end

  end

end
