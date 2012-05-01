require 'spec_helper'
require 'rubyquest/hero'

module Rubyquest

  describe Hero do

    let(:hero) { Hero.new 'Raistlin'}

    it "finds a hero through his name" do
      hero = Hero.find('Taz')
      hero.name.should eq('Taz')
    end

    it "doesn't find a hero with blank name" do
      hero = Hero.find('  ')
      hero.should be_nil
    end

    it "starts on level 1" do
      hero.level.should eq(1)
    end

  end
end
