%w(column structure).each { |dir| 
  Dir[File.join(File.dirname(__FILE__), dir, '*.rb')].each {|file| require file }
}

require_relative 'version'
require_relative 'class_methods'
require_relative 'structure'
require_relative 'column'
