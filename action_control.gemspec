$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "action_control/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
	s.name                  = "action_control"
	s.version               = ActionControl::VERSION
	s.required_ruby_version = '>= 1.9.3'
	s.authors               = ["Tobias Feistmantl"]
	s.email                 = ["tobias@feistmantl.net"]
	s.homepage              = "https://github.com/tobiasfeistmantl/actioncontrol"
	s.summary               = "An access control system for your app."
	s.description           = "Authorize your users directly in your controllers."
	s.license               = "MIT"

	s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
	s.test_files = Dir["test/**/*"]

	s.add_dependency "rails", ">= 4.0.0"
end
