module Rubyquest

  class CLI
    require 'readline'
    require 'rubyquest/output'
    require 'rubyquest/command'

    def start
      Output.display("Welcome to Rubyquest! Type 'help' to see the available commands.")
      # Leave the game without a Ruby exception upon interruption
      trap(:INT) { puts; exit }
      loop do
        yield if block_given?
        command = Readline.readline(prompt)
        Readline::HISTORY.push(command)
        Command.new command
        break if command == 'exit'
      end
    end

    private

    def prompt
      "Rubyquest ~> "
    end

  end
end
