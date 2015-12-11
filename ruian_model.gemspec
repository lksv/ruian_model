# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ruian_model/version'

Gem::Specification.new do |spec|
  spec.name          = "ruian_model"
  spec.version       = RuianModel::VERSION
  spec.authors       = ["Lukas Svoboda"]
  spec.email         = ["lukas.svoboda@gmail.com"]

  #if spec.respond_to?(:metadata)
  #  spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com' to prevent pushes to rubygems.org, or delete to allow pushes to any server."
  #end

  spec.summary       = %q{ActiveRecord Models for RUIAN data}
  spec.description   = %q{Model definition for basic RUIAN object persisted in Postgres (loaded by fordfrog/ruian2pgsql)}
  spec.homepage      = "https://github.com/lksv/ruian_model"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "activesupport", "~> 4.2"
  spec.add_dependency "activerecord", "~> 4.2"
  spec.add_dependency "pg"

  spec.add_development_dependency "bundler", "~> 1.8"
  spec.add_development_dependency "rake", "~> 10.0"
end
