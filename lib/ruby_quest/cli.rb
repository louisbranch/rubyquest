module RubyQuest

  class CLI
    require 'readline'
    require 'ruby_quest/output'
    require 'ruby_quest/command'
    require 'ruby_quest/hero'

    attr_reader :input, :output, :hero

    def initialize(input = ::Readline, output = ::RubyQuest::Output.new)
      @input, @output = input, output
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
      @output.announce "Greeting stranger, welcome to RubyQuest! May I have your name?"
    end
    
    def prompt
      "RubyQuest ~> "
    end

    def set_user
      until hero do
        name = input.readline(prompt)
        break if name == 'exit'
        if ( @hero = Hero.new(name) )
          output.announce "Nice to meet you #{@hero.name}"
        else
          output.announce "C'mon give me your name!"
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
