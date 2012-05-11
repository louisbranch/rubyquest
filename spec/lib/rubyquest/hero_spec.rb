require 'spec_helper'
require 'rubyquest/hero'

module Rubyquest

  Hero::HEROES_FILE = './spec/fixtures/data/heroes.yml'

  describe Hero do

    context "when finding" do

      it "loads this hero" do
        hero = Hero.load('Araevin')
        Hero.current_hero.should eq(hero)
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
        Hero.current_hero.should eq(hero)
      end

      it "displays that this new hero was created" do
        Output.should_receive(:display).with("You are now playing as Taz")
        Hero.create('Taz')
      end

      it "saves this hero" do
        Hero.any_instance.should_receive(:save)
        Hero.create('Taz')
      end

      it "displays that this hero already exist" do
        Output.should_receive(:display).with("Araevin already exist. Type 'hero Araevin' to play with him.")
        Hero.create('Araevin')
      end

    end

    it "starts on level 1" do
      hero = Hero.new({name: 'Raistlin'})
      hero.level.should eq(1)
    end

    it "shows all heroes" do
      Output.should_receive(:display).with("1. Araevin")
      Hero.list
    end

  end
end
