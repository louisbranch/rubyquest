require 'spec_helper'
require 'rubyquest/quest'

module Rubyquest

  describe Quest do

    it "loads all quests available" do
      path = './spec/fixtures/quests'
      Quest.should_receive(:new).twice
      Quest.load path
    end
    
    it "creates new quest from a YAML file" do
      yaml = YAML.load_file('./spec/fixtures/quests/baldurs_gate.yml')
      quest = Quest.new yaml
      quest.name.should eq "Baldur's Gate II"
    end

  end

end
