require 'spec_helper'
require 'rubyquest/quest'

module Rubyquest

  Quest::QUESTS_PATH = './spec/fixtures/quests/*.yml' # Loads quests 1 and 2

  describe Quest do

    it "list all quests available" do
      Output.should_receive(:display).with("1. Baldur's Gate II")
      Output.should_receive(:display).with("2. Planescape")
      Quest.list
    end

    it "creates new quest from a YAML file" do
      options = YAML.load_file('./spec/fixtures/quests/baldurs_gate.yml')
      quest = Quest.new(options)
      quest.name.should eq "Baldur's Gate II"
    end

    context "joining a quest" do

      let(:hero) { double("hero") }

      it "doesn't join a quest without having a hero" do
        Quest.join(1, nil)
        Quest.current_quest.should be_nil
      end

      it "shows that a hero is missing" do
        Output.should_receive(:display).with("You need to select a hero first. Type 'heroes' to list all heroes available or 'new hero <name>' to create a new one")
        Quest.join(1, nil)
      end

      it "doesn't join a quest using an invalid position number" do
        Quest.join(3, hero)
        Quest.current_quest.should be_nil
      end

      it "shows that this quest is invalid" do
        Output.should_receive(:display).with("3 is an invalid id. Type 'quest' to list all quests and 'join quest <id>' to join it.")
        Quest.join(3, hero)
      end

      it "joins a quest using an position number" do
        Quest.join(1, hero)
        Quest.current_quest.name.should eq("Baldur's Gate II")
      end

      it "shows the quest introduction to the player" do
        Output.should_receive(:display).with('A new age has begun...')
        Quest.join(1, hero)
      end

    end

  end

end
