module Rubyquest

  class CLI
    require 'readline'
    require 'rubyquest/output'
    require 'rubyquest/command'
    require 'rubyquest/hero'

    attr_reader :input, :hero

    def initialize input = ::Readline
      @input = input
    end

    def start!
      greetings
      # Leave the game without a Ruby exception upon interruption
      trap(:INT) { puts; exit }
      set_user
      console
    end

    private

    def greetings
      Output.display "Greeting stranger, welcome to Rubyquest! May I have your name?", :announce
    end
    
    def prompt
      "Rubyquest ~> "
    end

    def set_user
      until hero do
        name = input.readline(prompt)
        if ( @hero = Hero.find(name) )
          Output.display "Nice to meet you #{hero.name}. Type 'help' to see the available commands.", :announce
        else
          Output.display "C'mon give me your name!", :announce
        end
      end
    end

    def console
      loop do
        command = input.readline(prompt)
        Readline::HISTORY.push(command)
        Command.new command, hero
        break if command == 'exit'
      end
    end

  end
end
