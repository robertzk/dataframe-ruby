# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'data_frame/version'

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
  s.email     = ["technoguyrob@gmail.com"]

  s.license   = "MIT"
  s.homepage  = "https://github.com/robertzk/dataframe-ruby"

  # s.files = Dir[ 'Rakefile', 'README*', 'LICENSE*', '{lib,test}/**/*' ] &
  s.files = `git ls-files -z`.split("\x0")

  s.require_paths = ["lib"]

  s.add_dependency 'activesupport', '~> 4.1.4'

  s.add_development_dependency "rake", "~> 10"
  s.add_development_dependency "rs"
  s.add_development_dependency "guard"
  s.add_development_dependency "pry"
  s.add_development_dependency "pry-remote"
  s.add_development_dependency "pry-nav"
end

