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
      name = input.readline(prompt)
      @hero = Hero.new(name) 
      console
    end

    private

    def console
      loop do
        command = input.readline(prompt)
        Readline::HISTORY.push(command)
        Command.new command, hero
        break if command == 'exit'
      end
    end

    def greetings
      @output.announce "Greeting stranger, welcome to RubyQuest! May I have your name?"
    end
    
    def prompt
      "RubyQuest ~> "
    end

  end
end
