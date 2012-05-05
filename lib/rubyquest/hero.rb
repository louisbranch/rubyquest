module Rubyquest

  class Hero
    require 'rubyquest/map'

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

      def find(name)
        hero_attr = heroes.select { |h| h[:name] == name}
        hero = if hero_attr.any?
                new(hero_attr.first)
              else
                new({name: name})
              end
      end

      private

      def heroes
        @heroes = YAML.load_file('./.data/heroes.yml')
      end

    end

  end

end
