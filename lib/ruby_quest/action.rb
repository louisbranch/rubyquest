module RubyQuest

  module Action
    require 'ruby_quest/output'
    require 'ruby_quest/map'

    def go location
      if map.travel(location)
        output.action "You have reached the #{location.name}"      
      else
        output.action "You don't have #{location.name} on your map. Type 'map' to see the available locations"
      end
    end

    private

    def output
      @output ||= Output.new      
    end

    def map
      @map ||= Map.new
    end

  end

end
