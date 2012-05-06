module Rubyquest

  class Hero
    require 'rubyquest/map'
    require 'rubyquest/output'

    attr_reader :name

    def initialize options
      options.each do |k,v|
        instance_variable_set("@#{k}", v) unless v.nil?
      end
    end

    def level
      @level ||= 1
    end

    class << self

      attr_reader :heroes

      def load(name)
        result = find(name)
        hero = if result.any?
                Output.display("You are now playing as #{name}")
                new(result.first)
              else
                Output.display("#{name} doesn't exist. Type 'heroes' to list all heroes or 'new hero #{name}' to create a new one.")
                nil
              end
      end

      def create(name)
        result = find(name)
        hero = if result.empty?
                Output.display("You are now playing as #{name}")
                new({name: name})
              else
                Output.display("#{name} already exist. Type 'hero #{name}' to play with him.")
                nil
              end
      end

      private

      def find(name)
        heroes.select { |h| h[:name] == name}
      end

      def heroes
        @heroes = YAML.load_file('./.data/heroes.yml')
      end

    end

  end

end
