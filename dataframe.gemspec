require_relative 'lib/dataframe/version'

Gem::Specification.new do |s|
  s.name      = 'dataframe'
  s.version   = DataFrame::VERSION
  s.platform  = Gem::Platform::RUBY
  s.date      = Date.today.to_s

  s.summary     = "A translation of R's data.frame into Ruby"
  s.description = "This gem enables simple manipulation of matrix-like data " +
    "using a convention similar to the R programming language's data.frame "  +
    "construct"

  s.authors   = ["Robert Krzyzanowski"]
  s.email     = "technoguyrob@gmail.com"

  s.license   = "MIT"
  s.homepage  = "https://github.com/robertzk/dataframe-ruby"

  s.files = Dir[
    'Rakefile', 'README*', 'LICENSE*', '{lib,test}/**/*'
  ] & `git ls-files -z`.split("\x0")

  s.require_paths = ["lib"]

  s.add_dependency 'activesupport', '~> 3.2'

  s.add_development_dependency "rake", "~> 10"
end

