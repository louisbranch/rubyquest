module RubyQuest

  class Console
    require 'readline'

    def initialize
      puts "Welcome to RubyQuest!"

      # Leave the game without a Ruby exception upon interruption
      trap(:INT) { puts; exit }

      while input = ::Readline.readline(prompt, true)
        output = "You just said #{input}"
        puts output
      end
    end

    private
    
    def prompt
      "RubyQuest ~> "
    end

  end
end
