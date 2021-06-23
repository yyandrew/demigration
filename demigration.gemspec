require_relative "lib/demigration/version"

Gem::Specification.new do |spec|
  spec.name = "demigration"
  spec.version = Demigration::VERSION
  spec.authors = ["andrew yang"]
  spec.email = ["andrew@ekohe.com"]

  spec.summary = "Convert database table into migration file"
  spec.description = "Convert database table into migration file"
  spec.homepage = "https://github.com/yyandrew/demigration"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "https://rubygems.org/gems/demigration"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/yyandrew/demigration"
  spec.metadata["changelog_uri"] = "https://github.com/yyandrew/demigration"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path("..", __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir = "bin"
  spec.executables = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.add_dependency "thor", "~> 1.1.0"
  spec.add_dependency "activesupport", "~> 6.1"
  spec.add_development_dependency "pry", "~> 0.14"
  spec.add_development_dependency "standardrb", "~> 1.0"
  spec.add_development_dependency 'rspec', "~> 3.10"
end
