module RubyQuest

  class Command

    def initialize(string, hero)
      case string
      when /^go to (\D*)$/
        $1
        go $1, hero.map
      end
    end

    private

    def go location, map
      map.travel location
    end

  end

end
