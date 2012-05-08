module Rubyquest

  class Command
    require 'rubyquest/output'
    require 'rubyquest/quest'
    require 'rubyquest/hero'

    attr_reader :output

    def initialize string, hero = nil
      case string
      when /^help$/               then help
      when /^exit$/               then nil
      when /^quests$/             then Quest.list
      when /^heroes$/             then Hero.list
      when /^hero (.*)$/          then Hero.load($1)
      when /^new hero (.*)$/      then Hero.create($1)
      when /^go to (\D*)$/        then go $1, hero.map
      else invalid string
      end
    end

    private
    
    def list
      [
        'heroes',
        'hero <name>',
        'new hero <name>',
        'quests',
        'help',
        'exit'
      ]
    end

    def invalid command
      Output.display "'#{command}' is not a valid command. Type 'help' to see all available commands."
    end

    def help
      Output.display("Commands: " + list.join(', '))
    end

    def go location, map
      map.travel location
    end

  end

end
