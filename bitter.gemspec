# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bitter/version'

Gem::Specification.new do |spec|
  spec.name          = "bitter"
  spec.version       = Bitter::VERSION
  spec.authors       = ["Ben Pringle"]
  spec.email         = ["ben.pringle@gmail.com"]
  spec.description   = %q{Represent binary data using English words}
  spec.summary       = %q{Convert bits to words}
  spec.homepage      = "http://github.com/Pringley/bitter"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
