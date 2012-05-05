require 'spec_helper'
require 'rubyquest/output'

module Rubyquest

  describe Output do

    it "prints a announcement from the game" do
      Output.should_receive(:puts).with('** Let the game begin! **')
      Output.display('Let the game begin!', :announce)
    end

    it "prints the result of an action" do
      Output.should_receive(:puts).with('Let the game begin!')
      Output.display('Let the game begin!')
    end

  end

end
