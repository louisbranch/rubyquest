module RubyQuest

  module Action
    require 'output'
    require 'map'

    def go location
      if map.travel(location)
        output.action "You have reached the #{location.name}"      
      else
        output.action "You don't have #{location.name} on your map. Type 'map' to see the available locations"
      end
    end

    private

    def output
      Output.new      
    end

    def map
      Map.new
    end

  end

end
