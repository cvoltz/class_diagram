# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'class_diagram/version'

Gem::Specification.new do |spec|
  spec.name          = "class_diagram"
  spec.version       = ClassDiagram::VERSION
  spec.authors       = ["Christopher Voltz"]
  spec.email         = ["cjunk@voltz.ws"]
  spec.summary       = %q{Generates class diagrams for Ruby files.}
  spec.description   = %q{Generates class diagrams and package diagrams for Ruby files.}
  spec.homepage      = ""
  spec.license       = "GPL v2"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "cucumber"
  spec.add_development_dependency "pry"
end
