# -*- encoding: utf-8 -*-
require File.expand_path("../lib/rps/version", __FILE__)

Gem::Specification.new do |s|
  s.name        = "rps"
  s.version     = RPS::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Jari Bakken"]
  s.email       = ["jari.bakken@gmail.com"]
  s.homepage    = "http://github.com/jarib/rps"
  s.summary     = "Ruby Process Status"
  s.description = "ps for Ruby processes"

  s.required_rubygems_version = ">= 1.3.6"
  s.rubyforge_project         = "rps"

  s.add_dependency "ffi", "~> 1.0.9"

  s.add_development_dependency "bundler", ">= 1.0.0"
  s.add_development_dependency "rspec", ">= 2.0.0"
  s.add_development_dependency "autotest", ">= 4.4.5"

  s.files        = `git ls-files`.split("\n")
  s.executables  = `git ls-files`.split("\n").map{|f| f =~ /^bin\/(.*)/ ? $1 : nil}.compact
  s.require_path = 'lib'
end
