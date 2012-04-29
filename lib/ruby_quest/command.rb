module RubyQuest

  class Command

    # Dummy implementation
    def initialize(string, hero)
      go string, hero.map
    end

    private

    def go location, map
      map.travel location
    end

  end

end
