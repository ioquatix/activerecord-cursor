# coding: utf-8
require_relative 'lib/active_record/cursor/version'

Gem::Specification.new do |spec|
	spec.name          = "activerecord-cursor"
	spec.version       = ActiveRecord::Cursor::VERSION
	spec.authors       = ["Samuel Williams"]
	spec.email         = ["samuel.williams@oriontransfer.co.nz"]

	spec.summary       = "Provides efficient enumeration of large result sets."
	spec.homepage      = "https://github.com/ioquatix/activerecord-cursor"

	spec.files         = `git ls-files -z`.split("\x0").reject do |f|
		f.match(%r{^(test|spec|features)/})
	end
	spec.require_paths = ["lib"]

	spec.add_dependency "activerecord", "~> 5.0"

	spec.add_development_dependency "bundler", "~> 1.13"
	spec.add_development_dependency "rake", "~> 10.0"
	spec.add_development_dependency "rspec", "~> 3.0"
end
