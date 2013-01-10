# Encoding: UTF-8

Gem::Specification.new do |s|
  s.platform          = Gem::Platform::RUBY
  s.name              = 'refinerycms-long_term_assignments'
  s.version           = '1.0'
  s.description       = 'Ruby on Rails Long Term Assignments extension for Refinery CMS'
  s.date              = '2013-01-09'
  s.summary           = 'Long Term Assignments extension for Refinery CMS'
  s.require_paths     = %w(lib)
  s.files             = Dir["{app,config,db,lib}/**/*"] + ["readme.md"]

  # Runtime dependencies
  s.add_dependency             'refinerycms-core',    '~> 2.0.9'

  # Development dependencies (usually used for testing)
  s.add_development_dependency 'refinerycms-testing', '~> 2.0.9'
end
