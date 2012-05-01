module Rubyquest

  class Hero
    require 'rubyquest/map'

    attr_reader :name, :level, :map

    def initialize name
      @name = name
      @level = 1
      @map = Map.new
    end

    # Latter it will find the user from some place
    def self.find(name)
      name.strip!
      if !name.empty?
        new(name)
      else
        nil
      end
    end

  end

end
