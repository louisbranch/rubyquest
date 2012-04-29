require 'spec_helper'
require 'ruby_quest/cli'

module RubyQuest

  describe CLI do

    it "shows a greeting message" do
      output = double('output')
      output.should_receive(:announce).with("Welcome to RubyQuest!")
      CLI.new(output)
    end

    context "when it starts" do

      let(:cli) { CLI.new }

      it "loads the console"

      it "shows a prompt message"

    end
  end
end
