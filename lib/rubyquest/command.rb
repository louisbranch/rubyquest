module Rubyquest

  class Command
    require 'rubyquest/output'

    attr_reader :output

    COMMANDS = [
                'go to <place>',
                'help',
                'exit'
               ]

    def initialize(string, hero, output = Output.new)
      @output = output
      case string
      when /^help$/
        help
      when /^go to (\D*)$/
        $1
        go $1, hero.map
      when /^exit$/
        nil
      else
        invalid(string)
      end
    end

    private

    def invalid(command)
      output.action "'#{command}' is not a valid command. Type 'help' to see all available commands."
    end

    def help
      commands = "Commands: " << COMMANDS.join(', ')
      output.action commands
    end

    def go location, map
      map.travel location
    end

  end

end
