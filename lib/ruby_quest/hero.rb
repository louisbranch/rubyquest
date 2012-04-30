module RubyQuest

  class Hero
    require 'ruby_quest/map'

    attr_reader :name, :level, :map

    def initialize name, output = Output.new
      @name = name
      @level = 1
      @map = Map.new
    end

  end

end
