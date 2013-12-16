# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'nameit/version'

Gem::Specification.new do |spec|
  spec.name          = "nameit"
  spec.version       = Nameit::VERSION
  spec.authors       = ["Fletcher Nichol"]
  spec.email         = ["fnichol@nichol.ca"]
  spec.description   = %q{Nameit is a small zero-dependency library and tool that helps you generate a random name for a project, database, session--you decide. You get glorious - style names such as "pushy-clock" and "lovely-ducks" or ask for a random number on the end to give you names like "numberless-cactus-123" and "superb-shoes-915".}
  spec.summary       = %q{Give it a name, why dont'cha?}
  spec.homepage      = "http://fnichol.github.com/nameit"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "minitest"
  spec.add_development_dependency "simplecov"
end
