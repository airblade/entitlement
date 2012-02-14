# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "entitlement/version"

Gem::Specification.new do |s|
  s.name        = 'entitlement'
  s.version     = Entitlement::VERSION
  s.authors     = ['Andy Stewart']
  s.email       = ['boss@airbladesoftware.com']
  s.homepage    = 'https://github.com/airblade/entitlement'
  s.summary     = 'Simple page titles in Rails 3.'
  s.description = s.summary

  s.rubyforge_project = 'entitlement'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_runtime_dependency 'rails', '~> 3'
end
