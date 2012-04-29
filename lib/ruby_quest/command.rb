module RubyQuest

  class Command
    require 'ruby_quest/output'

    attr_reader :output

    def initialize output = ::RubyQuest::Output.new
      @output = output
    end

    def go location, map
      if map.travel(location)
        output.react "You have reached the #{location.name}"      
      else
        output.react "Forest is not on your map. Type 'map' to list all avaiable locations"
      end
    end

  end

end
