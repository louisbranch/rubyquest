module Rubyquest

  class Command
    require 'rubyquest/output'
    require 'rubyquest/quest'

    attr_reader :output

    COMMANDS = [
                'go to <place>',
                'help',
                'exit'
               ]

    def initialize string, hero = nil
      case string
      when /^help$/
        help
      when /^exit$/
        nil
      when /^quests$/
        Quest.load
      when /^go to (\D*)$/
        $1
        go $1, hero.map
      else
        invalid string
      end
    end

    private

    def invalid command
      Output.message "'#{command}' is not a valid command. Type 'help' to see all available commands."
    end

    def help
      commands = "Commands: " << COMMANDS.join(', ')
      Output.message commands
    end

    def go location, map
      map.travel location
    end

  end

end
