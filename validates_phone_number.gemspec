# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "validates_phone_number/version"

Gem::Specification.new do |s|
  s.name        = "validates_phone_number"
  s.version     = ValidatesPhoneNumber::VERSION
  s.authors     = ["Travis Jeffery"]
  s.email       = ["t@travisjeffery.com"]
  s.homepage    = ""
  s.summary     = %q{Adds validation methods to ActiveModel for validating dates and times.}
  s.description = %q{Adds validation methods to ActiveModel for validating dates and times.}

  s.rubyforge_project = "validates_phone_number"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency "minitest"
  s.add_development_dependency "rails"
  s.add_development_dependency "phone"
  s.add_runtime_dependency "phone"
end
