module RubyQuest

  class Hero
    require 'ruby_quest/map'
    require 'ruby_quest/output'

    attr_reader :name, :level, :map

    def initialize name, output = Output.new
      @name = name
      @level = 1
      @map = Map.new
      output.action "Nice to meet you #{name}"
    end

  end

end
