# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rack/fake_method/version'

Gem::Specification.new do |spec|
  spec.name          = "rack-fake-method"
  spec.version       = Rack::FakeMethod::VERSION
  spec.authors       = ["Thorben Schröder"]
  spec.email         = ["stillepost@gmail.com"]
  spec.description   = %q{A middleware to fake all HTTP methods types with the ``FAKE-METHOD`` header}
  spec.summary       = %q{A middleware to fake all HTTP methods types with the ``FAKE-METHOD`` header}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rack-client"
end
