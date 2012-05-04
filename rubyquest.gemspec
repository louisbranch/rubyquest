Gem::Specification.new do |s|
  s.name        = 'rubyquest'
  s.version     = '0.0.1'
  s.date        = '2012-04-28'
  s.summary     = 'Rubyquest is a text-based game made, well, in Ruby!'
  s.description = 'The game development is still in its early days, the main goal is to provide a simple framework to create rpg quests in Ruby.'
  s.authors     = ['Luiz Branco']
  s.email       = 'me@luizbranco.com'
  s.homepage    = 'http://github.com/luizbranco/rubyquest'
  s.executables = ['rubyquest']
  s.files       = [
    'Gemfile',
    'Gemfile.lock',
    'README.md',
    'bin/rubyquest',
    'lib/rubyquest.rb',
    'lib/rubyquest/cli.rb',
    'lib/rubyquest/command.rb',
    'lib/rubyquest/hero.rb',
    'lib/rubyquest/map.rb',
    'lib/rubyquest/output.rb',
    'lib/rubyquest/quest.rb',
    'rubyquest.gemspec'
  ]
  s.require_paths = ['lib']
end
