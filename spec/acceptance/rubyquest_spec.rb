require 'spec_helper'
require 'rubyquest'

module Rubyquest
  describe Rubyquest do

    it "play an entire game" do
      Command.any_instance.should_receive(:invalid).never # Raise error on invalid commands
      CLI.new.start do
        t 'help'
        t 'heroes'
        t 'new hero Erevis'
        t 'quests'
        t 'join quest 1'
        exit
      end
    end

    private

    def t(command)
      Command.new(command)
    end

    def exit
      Readline.stub(:readline).and_return('exit')
    end

  end
end
