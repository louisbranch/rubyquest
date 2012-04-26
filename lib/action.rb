module RubyQuest

  module Action

    attr_accessor :location

    def go location
      self.location = location
      Output.action "You have reached the #{location.name}"      
    end

  end

end
