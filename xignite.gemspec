# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require 'xignite/version'

Gem::Specification.new do |s|
  s.name        = "xignite"
  s.version     = Xignite::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Nate Clark"]
  s.email       = ["nate@nateclark.com"]
  s.homepage    = "http://github.com/heythisisnate/xignite"
  s.summary     = "A Ruby client library for the (Xignite)[http://xignite.com/] web services"
  s.description = "Access the Xignite financial data web services with a simple and intuitive Ruby library"

  s.required_rubygems_version = ">= 1.3.6"

  s.add_development_dependency "rspec"
  s.add_development_dependency "rspec"

  s.add_runtime_dependency 'curb'
  s.add_runtime_dependency 'crack'
  s.add_runtime_dependency 'tzinfo'

  s.files        = Dir.glob("{lib}/**/*") + %w(LICENSE README.md CHANGELOG.md)
  s.require_path = 'lib'
end