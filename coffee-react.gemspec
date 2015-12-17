# coding: utf-8
require 'rubygems'
require 'yaml'
package = YAML.load_file(File.join(File.dirname(__FILE__), 'package.json'))

puts `./prepublish.sh`

Gem::Specification.new do |s|
  s.name      = 'coffee-react'
  s.version   = package["version"]
  s.homepage    = "http://github.com/jsdf/ruby-coffee-react"
  s.summary     = "coffee-react-transform for ruby"
  s.description = <<-EOS
    ruby-coffee-react is a bridge to the npm coffee-react-transform module, which 
    transforms CJSX (Coffeescript with React JSX-style markup) into valid Coffeescript.
    If you want to use CJSX with Rails/Sprockets, see the sprockets-coffee-react gem.
  EOS
  s.license = "MIT"

  s.files = [
    'lib/coffee-react.rb',
    'lib/coffee_react.rb',
    'coffee-react-transform.js',
    'js-syntax-transform.js',
    'LICENSE',
    'README.md'
  ]

  s.add_dependency 'execjs'
  s.add_development_dependency 'json'
  s.add_development_dependency 'rake'

  s.authors = ['James Friend']
  s.email   = 'james@jsdf.co'
end
