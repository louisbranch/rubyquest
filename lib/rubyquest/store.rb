module Rubyquest::Store

  require 'yaml/store'

  def self.included(klass)
    klass.extend ClassMethods
  end

  module ClassMethods

    BASE_PATH = './.data/'

    def storage(file)
      @storage = BASE_PATH + "#{file}.store"
    end

  end

  def save
  end

end
