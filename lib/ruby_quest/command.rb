class TheGame::Command
  class << self
    def send(game, input)
      input.strip!

      # Allow interpolation in the form of $(command) => output of command
      input.gsub!(/\$\((.*)\)/) { send(self, $1.to_s) }

      unless input.empty?
        # The method to send to TheGame::Command with +_+ before it
        method = input.words.first
        
        # Not an array! Use String#args to get an argument array.
        args = input.remove_first_word

        __send__("_#{method.command_sanitize.downcase}", game, args)
      end
    end

    def method_missing(m, g, a); "#{m.to_s.command_sanitize}: command not found"; end
    
    def available_methods
      methods(false).select{ |m| m.match(/^_/) }.map{ |m| m.to_s.command_sanitize }
    end

    def _raise(g, a); raise TheGame::Exceptions::FuntimeError, a; end

    def _args(g, a); a.args.inspect; end

    def _echo(g, a); a; end
    
    def _set(g, a)
      value = a.remove_first_word
      if value.blank?
        "Usage: set [key] [value]"
      else
        key = a.words.first.to_s.downcase
        pretty_rescue do
          g.set(key, value)
          "#{key.capitalize} set to #{value.inspect}"
        end
      end
    end
    
    def _lol(g, a)
      iteration = 0
      messages = [ "U MAD BRO?", "PROBLEM?" ]
      loop do
        message = messages[ iteration % messages.size ].center(10)
        41.upto(45) do |code|
          message.scan(/./).each do |char|  
            print "\e[#{code};39;1m"
            print char * ((rand * 1.01) + 1)
            print "\e[0m"
          end
          iteration += 1
        end
        sleep 0.005
      end
    end

    def _help(g, a); "Commands available: [ #{available_methods.join(', ')} ]"; end
    
    def _version(g, a); "the_game v#{TheGame::Version::STRING}"; end
    
    def _license(g, a); TheGame::LICENSE; end

    def _game(g, a); g.inspect; end
    
    def _items(g,a); g.items.inspect; end
    
    def _save(g, a); pretty_rescue { g.save; "Game saved." }; end

    def _read_savefile(g, a); pretty_rescue { g.read_savefile }; end

    def _load(g, a)
      pretty_rescue do
        g.load
        "Game (name => #{g.name}, saved_at => #{g.saved_at.strftime("%F %R")}) loaded."
      end
    end

    def _quit(g, a); exit; end
  end
end
