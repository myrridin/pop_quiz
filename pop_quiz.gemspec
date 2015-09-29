Gem::Specification.new do |s|
  s.name        = 'popquiz'
  s.version     = '0.0.3'
  s.authors     = ['Thomas Hart']
  s.summary     = 'PopQuiz is a micro inline testing framework for Ruby'
  s.email       = 'tom@thomashart.me'
  s.files       = ['lib/pop_quiz.rb']
  s.homepage    = 'http://rubygems.org/gems/popquiz'
  s.license     = 'MIT'
  s.add_development_dependency 'rspec', '3.3.0'
  s.add_development_dependency 'guard', '2.13.0'
  s.add_development_dependency 'guard-rspec', '4.6.4'
end
