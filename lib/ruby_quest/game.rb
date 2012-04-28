module RubyQuest

  class Game
    require 'readline'

    def initialize
      start!
    end
    
    def prompt
      "\e[1;32m#{@name} \e[35m/ \e[34m#{@level} $\e[0m "
    end

    def start!
      puts "Welcome to RubyQuest!"

      trap(:INT) { puts; exit }

      loop do
        input = ::Readline.readline(prompt, true)
        output = begin
                   puts "This is how we do it #{input}"
                 rescue => e
                   e.pp
                 end
        puts output 
      end
    end
  end
end
