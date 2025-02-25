# frozen_string_literal: true

require_relative "lib/okex/api/version"

Gem::Specification.new do |spec|
  spec.name          = "okex-ruby-api"
  spec.version       = OKEX::API::VERSION
  spec.authors       = ["benrs44"]
  spec.email         = ["ben@certoris.com"]

  spec.summary       = "Ruby gem for the OKEX Exchange API"
  spec.description   = "Ruby gem for the OKEX Exchange API"
  spec.homepage      = "https://github.com/benrs44/okex-ruby-api"
  spec.license       = "MIT"
  spec.required_ruby_version = ">= 3.0.1"

  # spec.metadata["allowed_push_host"] = "TODO: Set to 'https://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/benrs44/okex-ruby-api"
  spec.metadata["changelog_uri"] = "https://github.com/benrs44/okex-ruby-api/blob/master/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  spec.add_dependency "httparty"
  spec.add_dependency "openssl"

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
end
