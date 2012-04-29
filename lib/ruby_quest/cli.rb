module RubyQuest

  class CLI
    require 'readline'
    require 'ruby_quest/output'

    attr_reader :output

    def initialize(output = ::RubyQuest::Output.new)
      @output = output
      greetings
    end

    def start!
      # Leave the game without a Ruby exception upon interruption
      trap(:INT) { puts; exit }

      loop do
        input = ::Readline.readline(prompt)
        # Include input text on history, accessible by up-arrow key
        Readline::HISTORY.push(input)
        puts "You typed: #{input}"
        break if input == 'exit'
      end
    end

    private

    def greetings
      @output.announce "Welcome to RubyQuest!"
    end
    
    def prompt
      "RubyQuest ~> "
    end

  end
end
