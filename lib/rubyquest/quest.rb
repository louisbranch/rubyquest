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

      attr_reader :quests, :current

      def list
        quests.each_with_index do |quest, i|
          Output.display("#{i+1}. #{quest['name']}")
        end
      end

      def join(id)
        position = (id.to_i - 1)
        if quests[position]
          @current = new(quests[position])
          Output.display(current.introduction)
        else
          @current = nil
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
