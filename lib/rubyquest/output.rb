module Rubyquest
  class Output

    def self.message text, type = :action
      output = new
      message = output.instance_eval "#{type}('#{text}')"
      puts message
    end

    private

    def announce text
      "** #{text} **" 
    end

    def action text
      text
    end

  end
end
