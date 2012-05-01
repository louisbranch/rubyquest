require 'spec_helper'
require 'rubyquest/command'

module Rubyquest

  describe Command do

    it "goes to a place" do
      map = double('map')
      hero = double('hero', :map => map )
      map.should_receive(:travel).with('forest')
      command = Command.new 'go to forest', hero
    end

  end
end
