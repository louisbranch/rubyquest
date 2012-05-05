require 'spec_helper'
require 'rubyquest'

module Rubyquest
  describe Rubyquest do

    it "play an entire game" do
      CLI.new.start! do
        t 'help'
        t 'create hero Erevis'
        exit
      end
    end

    private

    def t command
      Command.new command
    end

    def exit
      Readline.stub(:readline).and_return('exit')
    end

  end
end
