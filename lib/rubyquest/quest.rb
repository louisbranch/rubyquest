module Rubyquest

  class Quest
    require 'yaml'

    attr_reader :name

    def initialize yaml
      parse yaml
    end

    def self.load path
      files = Dir.glob( path + '/*.yml')
      files.each do |file|
        quest = YAML.load_file file
        new(quest)
      end
    end

    private

    def parse yaml
      quest = yaml['quest']
      @name = quest['name']      
    end

  end

end
