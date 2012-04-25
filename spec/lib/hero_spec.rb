require 'spec_helper'
require 'hero'

module RubyQuest

  describe Hero do

    it "has a name" do
      hero = Hero.new 'Raistlin'
      hero.name.should eq('Raistlin')
    end

  end
end
