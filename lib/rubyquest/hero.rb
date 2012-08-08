module Rubyquest

  class Hero
    require 'rubyquest/output'
    require 'rubyquest/store'

    include Store
    storage :heroes

    HEROES_FILE = '.data/heroes.yml'

    attr_reader :name

    def initialize(options = {})
      options.each do |k,v|
        instance_variable_set("@#{k}", v) unless v.nil?
      end
    end

    def level
      @level ||= 1
    end

    class << self

      attr_reader :heroes, :current_hero

      def list
        heroes.each_with_index do |hero, i|
          Output.display("#{i+1}. #{hero['name']}")
        end
      end

      def load(name)
        result = find(name)
        @current_hero = if result.any?
                 Output.display("You are now playing as #{name}")
                 new(result.first)
               else
                 Output.display("#{name} doesn't exist. Type 'heroes' to list all heroes or 'new hero #{name}' to create a new one.")
                 nil
               end
      end

      def create(name)
        result = find(name)
        @current_hero = if result.empty?
                 Output.display("You are now playing as #{name}")
                 hero = new({name: name})
                 hero.save
               else
                 Output.display("#{name} already exist. Type 'hero #{name}' to play with him.")
                 nil
               end
      end

      private

      def find(name)
        heroes.select { |h| h['name'] == name}
      end

      def heroes
        @heroes = YAML.load_file(HEROES_FILE) || []
      end

    end

  end

end
