module RubyQuest

  class Hero
    include Action
    attr_reader :name, :level

    def initialize name
      @name = name
      @level = 1
    end

  end

end
