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

    context "when going to a location" do

      it "goes to this location if it's available"

      it "informs that the location has been reached" do
        Output.should_receive(:action).with('You have reached the forest')
        actor.go 'forest'
      end

      it "informs that this location isn't available"

    end

  end

end
