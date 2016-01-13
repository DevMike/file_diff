Gem::Specification.new do |s|
  s.name        = 'file_diff'
  s.version     = '0.0.1'
  s.date        = '2016-01-13'
  s.summary     = 'diff by multiple files'
  s.description = 'gem to make a diff between multiple files'
  s.authors     = ['Mike Zarechenskiy']
  s.email       = 'zarechenskiy.mihail@gmail.com'
  s.files       = ['lib/file_diff.rb', 'bin/file_diff']
  s.homepage    = 'https://github.com/DevMike/file_diff'
  s.license     = 'MIT'
  s.executables << 'file_diff'

  s.add_development_dependency 'test-unit', '~> 3.1.5'
end