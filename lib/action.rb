module RubyQuest

  module Action

    attr_accessor :location

    def go location
      if on_map?(location)
        self.location = location
        Output.action "You have reached the #{location.name}"      
      else
        Output.action "You don't have #{location.name} on your map. Type 'map' to see the available locations"
      end
    end

    private

    def on_map?(location)
      {:available => ['forest'] }.include?(location)      
    end

  end

end
