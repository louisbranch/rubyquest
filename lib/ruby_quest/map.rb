module RubyQuest

  class Map
    require 'ruby_quest/output'

    attr_reader :output, :list

    def initialize(output = Output.new)
      @output = output
    end

    def current
      @location ||= 'limbo'
    end

    def travel location
      if current == location
        message = "You already are in forest"
      elsif on_map? location
        self.current = location 
        message = "You have reached the forest"
      else
        message = "Forest is not on your map. Type 'map' to list all avaiable locations"
      end
      output.action message
    end

    def list
      @list ||= []
    end

    private

    def current= location
      @location = location
    end

    # In the future need to be a tree
    def add location
      @list << location
    end

    def on_map? location
      list.include? location
    end

  end

end
