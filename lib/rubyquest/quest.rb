module Rubyquest

  class Quest
    require 'yaml'
    require 'rubyquest/output'

    QUESTS_PATH = './quests/*.yml'

    attr_reader :name

    def initialize(options = {})
      options.each do |k,v|
        instance_variable_set("@#{k}", v) unless v.nil?
      end
    end

    class << self

      attr_reader :quests

      def list
        quests.each_with_index do |quest, i|
          Output.display("#{i+1}. #{quest[:name]}")
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
