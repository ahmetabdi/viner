# -*- encoding: utf-8 -*-
require File.expand_path("../lib/viner/version", __FILE__)

Gem::Specification.new do |s|
  s.name        = "viner"
  s.version     = Viner::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Ahmet Abdi"]
  s.email       = ["ahmetabdi@gmail.com"]
  s.homepage    = "https://github.com/ahmetabdi/viner"
  s.summary     = "Vine API"
  s.description = "Vine API"

  s.required_rubygems_version = ">= 1.3.6"
  s.required_ruby_version = '>= 2.0.0'

  s.add_development_dependency "bundler"
  s.add_development_dependency "rspec"
  s.add_development_dependency "cucumber"
  s.add_development_dependency "aruba"
  s.add_dependency "hashie"
  s.add_dependency "activesupport"

  s.files        = `git ls-files`.split("\n")
  s.executables  = `git ls-files`.split("\n").map{|f| f =~ /^bin\/(.*)/ ? $1 : nil}.compact
  s.require_path = 'lib'
end
