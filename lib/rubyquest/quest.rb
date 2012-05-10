module Rubyquest

  class Quest
    require 'yaml'
    require 'rubyquest/output'

    QUESTS_PATH = './quests/*.yml'

    attr_reader :name, :introduction

    def initialize(options = {})
      options.each do |k,v|
        instance_variable_set("@#{k}", v) unless v.nil?
      end
    end

    class << self

      attr_reader :quests, :current_quest

      def list
        quests.each_with_index do |quest, i|
          Output.display("#{i+1}. #{quest['name']}")
        end
      end

      def join(id, hero)
        unless hero
          Output.display("You need to select a hero first. Type 'heroes' to list all heroes available or 'new hero <name>' to create a new one")
          return nil
        end
        position = (id.to_i - 1)
        if quests[position]
          @current_quest = new(quests[position])
          Output.display(current_quest.introduction)
        else
          @current_quest = nil
          Output.display("#{id} is an invalid id. Type 'quest' to list all quests and 'join quest <id>' to join it.")
        end
      end

      private

      def quests
        @quests = fetch
      end

      def fetch
        quests = []
        files = Dir.glob(QUESTS_PATH)
        files.each do |file|
          quests << YAML.load_file(file)
        end
        quests
      end

    end

  end

end
