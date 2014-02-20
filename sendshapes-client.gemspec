# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sendshapes/version'

Gem::Specification.new do |spec|
  spec.name          = "sendshapes-client"
  spec.version       = Sendshapes::VERSION
  spec.authors       = ["Vilius Luneckas"]
  spec.email         = ["vilius.luneckas@gmail.com"]
  spec.summary       = %q{SendShapes API Client}
  spec.description   = %q{SendShapes API Client}
  spec.homepage      = "https://github.com/ViliusLuneckas/sendshapes-client"

  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
end
