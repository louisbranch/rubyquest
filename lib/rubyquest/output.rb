module Rubyquest
  class Output

    attr_reader :message, :type

    def self.display message, type = :action
      text = new(message, type).format
      puts text
    end

    def initialize message, type
      @message, @type = message, type
    end

    def format
      case type
      when :action
        message
      when :announce
        "** #{message} **"
      end
    end

  end
end
