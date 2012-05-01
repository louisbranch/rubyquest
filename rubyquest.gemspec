Gem::Specification.new do |s|
  s.name        = 'rubyquest'
  s.version     = '0.0.1'
  s.date        = '2012-04-28'
  s.summary     = "RubyQuest is a text-based game made, well, in Ruby!"
  s.authors     = ["Luiz Branco"]
  s.email       = 'me@luizbranco.com'
  s.executables = ["rubyquest"]
  s.files       = [
    "Gemfile",
    "Gemfile.lock",
    "README.md",
    "bin/rubyquest",
    "lib/rubyquest.rb",
    "lib/rubyquest/cli.rb",
    "lib/rubyquest/output.rb",
    "lib/rubyquest/command.rb",
    "lib/rubyquest/map.rb",
    "lib/rubyquest/hero.rb",
    "rubyquest.gemspec"
  ]
  s.require_paths = ["lib"]
end
