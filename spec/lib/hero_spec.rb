require 'spec_helper'
require 'action'
require 'hero'

module RubyQuest

  describe Hero do

    let(:hero) { Hero.new 'Raistlin'}

    it "has a name" do
      hero.name.should eq('Raistlin')
    end

    it "starts on level 1" do
      hero.level.should eq(1)
    end

  end
end
