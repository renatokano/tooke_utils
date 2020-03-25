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

  spec.summary       = "TookeUtils"
  spec.description   = "In this version, this toolkit allows the generation, validation and formating of CPF's and CNPJ's. For now, the use is exclusive to Brazil."
  spec.homepage      = "https://github.com/renatokano/#{name}"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", ">= 2.1.2"
  spec.add_development_dependency "rake", ">= 12.3.3"
  spec.add_development_dependency "rspec", "~> 3.0"
end
