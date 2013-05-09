# coding: utf-8
#
Gem::Specification.new do |spec|
  spec.name          = "peek-active_record"
  spec.version       = "0.5.0"
  spec.authors       = ["Will Farrington"]
  spec.email         = ["wfarr@github.com"]
  spec.description   = %q{Peek into your ActiveRecord stats.}
  spec.summary       = %q{Peek into your ActiveRecord stats.}
  spec.homepage      = "https://github.com/wfarr/peek-active_record"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "activerecord", "~> 3.2.0"
  spec.add_dependency "atomic",       ">= 1.0.0"
  spec.add_dependency "peek",         ">= 0.1.0"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
