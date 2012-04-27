module RubyQuest

  module Action
    require 'output'

    attr_accessor :location

    def go location
      if on_map?(location)
        self.location = location
        output.action "You have reached the #{location.name}"      
      else
        output.action "You don't have #{location.name} on your map. Type 'map' to see the available locations"
      end
    end

    private

    def on_map?(location)
      {:available => ['forest'] }.include?(location)      
    end

    def output
      Output.new      
    end

  end

end
