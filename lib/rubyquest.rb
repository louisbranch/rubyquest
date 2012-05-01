require 'rubyquest/cli'

module Rubyquest
  DIR   = File.expand_path("~/.rubyquest")
  
  class << self
    def initialize!
      Dir.mkdir(DIR) unless File.directory? DIR
    end
  end
end
