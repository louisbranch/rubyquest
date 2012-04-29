require 'ruby_quest/cli'

module RubyQuest
  DIR   = File.expand_path("~/.ruby_quest")
  
  class << self
    def initialize!
      Dir.mkdir(DIR) unless File.directory? DIR
    end
  end
end
