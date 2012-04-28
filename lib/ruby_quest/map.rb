module RubyQuest

  class Map

    def now
      @location ||= 'limbo'
    end

    def travel(location)
     self.now = location 
    end
    
    private

    def now=(location)
      @location = location
    end

  end

end
