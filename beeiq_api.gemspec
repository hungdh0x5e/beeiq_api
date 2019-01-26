
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "beeiq_api/version"

Gem::Specification.new do |spec|
  spec.name          = "beeiq_api"
  spec.version       = BeeiqAPI::VERSION
  spec.authors       = ["Huy Hùng"]
  spec.email         = ["huyhung1994@gmail.com"]

  spec.summary       = "BeeIQ REST API Client"
  spec.description   = "Ruby wrapper for the REST API at https://www.beeiq.com. Documentation at https://guide.antbuddy.com/kb/instructions-to-enter-data-into-beeiq-data-platform"
  spec.homepage      = "https://github.com/hungdh0x5e/beeiq_api"
  spec.license       = "MIT"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "webmock", "~> 3.5"
  spec.add_runtime_dependency "rest-client", "~> 2.0"
end
