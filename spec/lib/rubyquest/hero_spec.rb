require 'spec_helper'
require 'rubyquest/hero'

module Rubyquest

  describe Hero do

    context "when finding a hero" do

      before do
        Hero.stub(:heroes).and_return([{name: 'Araevin'}])
      end

      it "loads an existing hero" do
        hero = Hero.find('Araevin')
        hero.name.should eq 'Araevin'
      end

      it "creates a new hero" do
        hero = Hero.find('Taz')
        hero.name.should eq('Taz')
      end

    end

    it "starts on level 1" do
      hero = Hero.new({name: 'Raistlin'})
      hero.level.should eq(1)
    end

    it "shows all heroes"

  end
end
