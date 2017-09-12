# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "tooke_utils/version"
name = "tooke_utils"

Gem::Specification.new do |spec|
  spec.name          = name
  spec.version       = TookeUtils::VERSION
  spec.authors       = ["Renato Kano"]
  spec.email         = ["renatokano16@gmail.com"]

  spec.summary       = "Tooke Toolkit"
  spec.description   = "CPF/CNPJ validators"
  spec.homepage      = "https://github.com/renatokano/#{name}"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
