# encoding: utf-8
Gem::Specification.new do |s|
  s.name        = 'desplatter'
  s.version     = '1.0.0'
  s.platform    = Gem::Platform::RUBY
  s.licenses    = ['MIT']
  s.authors     = ['James McLaren', 'Erin Francis']
  s.email       = 'james@workplacearcade.com'
  s.homepage    = 'https://github.com/workplacearcade/desplatter'
  s.summary     = 'Arcade Command object simplifier'
  s.description = 'Sets up instance variables and attr_accessors for method arguments'
  s.files = ['lib/desplatter.rb']

  s.test_files    = `git ls-files`.split($RS)
  s.require_paths = ['lib']
end
