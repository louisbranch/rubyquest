require 'spec_helper'
require 'ruby_quest/action'

module RubyQuest

  class Dummy
    include Action
  end

  describe Action do

    let(:actor) { Dummy.new }

    context "when going to a new location" do

      let(:forest) { double('new_location', :name => 'forest')}

      it "informs that the location has been reached" do
        actor.stub_chain(:map, :travel).and_return(true)
        output = double('output')
        actor.stub(:output).and_return(output)
        output.should_receive(:action).with('You have reached the forest')
        actor.go forest
      end

      it "informs that this location is unavailable" do
        actor.stub_chain(:map, :travel).and_return(false)
        output = double('output')
        actor.stub(:output).and_return(output)
        output.should_receive(:action).with("You don't have forest on your map. Type 'map' to see the available locations")
        actor.go forest
      end

    end
  end
end
