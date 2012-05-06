require 'spec_helper'
require 'rubyquest/hero'

module Rubyquest

  describe Hero do

    context "setting a hero" do

      before do
        Hero.stub(:heroes).and_return([{name: 'Araevin'}])
      end

      context "when finding" do

      it "loads this hero" do
        hero = Hero.load('Araevin')
        hero.should be_instance_of Hero
      end

      it "displays that this hero was loaded" do
        Output.should_receive(:display).with('You are now playing as Araevin')
        Hero.load('Araevin')
      end

      it "displays that this hero doesn't exist" do
        Output.should_receive(:display).with("Taz doesn't exist. Type 'heroes' to list all heroes or 'new hero Taz' to create a new one.")
        Hero.load('Taz')
      end

      end

      context "when creating" do

      it "creates a new hero" do
        hero = Hero.create('Taz')
        hero.should be_instance_of Hero
      end

      it "saves this new hero"

      it "displays that this new hero was created" do
        Output.should_receive(:display).with("You are now playing as Taz")
        Hero.create('Taz')
      end

      it "displays that this hero already exist" do
        Output.should_receive(:display).with("Araevin already exist. Type 'hero Araevin' to play with him.")
        Hero.create('Araevin')
      end

      end

    end

    it "starts on level 1" do
      hero = Hero.new({name: 'Raistlin'})
      hero.level.should eq(1)
    end

    it "shows all heroes"

  end
end
