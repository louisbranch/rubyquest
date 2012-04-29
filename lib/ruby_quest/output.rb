module RubyQuest
  class Output

    def announce(message)
      puts "** #{message} **" 
    end

    def react(message)
      puts message
    end

  end
end
