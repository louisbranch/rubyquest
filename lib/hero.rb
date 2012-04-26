module RubyQuest

  class Hero
    attr_reader :name, :level

    def initialize name
      @name = name
      @level = 1
    end

  end

end
