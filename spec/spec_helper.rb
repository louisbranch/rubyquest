require 'rspec'
require 'simplecov'
SimpleCov.start

RSpec.configure do |c|
  c.mock_with :rspec
  c.before(:each) do
    Rubyquest::Output.stub(:puts) # Quiet output
  end
end
