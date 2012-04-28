Gem::Specification.new do |s|
  s.name        = 'ruby_quest'
  s.version     = '0.0.1'
  s.date        = '2012-04-28'
  s.summary     = "RubyQuest is a text-based game made, well, in Ruby!"
  s.authors     = ["Luiz Branco"]
  s.email       = 'me@luizbranco.com'
  s.executables = ["ruby_quest"]
  s.files       = [
    "Gemfile",
    "Gemfile.lock",
    "README.md",
    "bin/ruby_quest",
    "lib/ruby_quest.rb",
    "lib/ruby_quest/game.rb",
    "ruby_quest.gemspec"
  ]
  s.require_paths = ["lib"]
end
