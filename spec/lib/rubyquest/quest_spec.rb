require 'spec_helper'
require 'rubyquest/quest'

module Rubyquest

  Quest::QUESTS_PATH = './spec/fixtures/quests/*.yml'

  describe Quest do

    it "list all quests available" do
      Output.should_receive(:display).twice
      Quest.list
    end

    it "loads a quest"
    
    it "creates new quest from a YAML file" do
      options = YAML.load_file('./spec/fixtures/quests/baldurs_gate.yml')
      quest = Quest.new(options)
      quest.name.should eq "Baldur's Gate II"
    end

  end

end
