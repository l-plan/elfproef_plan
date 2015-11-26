$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "elfproef_plan/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "elfproef_plan"
  s.version     = ElfproefPlan::VERSION
  s.authors     = ["Rolf van der Geize,L-Plan"]
  s.email       = ["rolf@l-plan.nl"]
  s.homepage    = "https://github.com/l-plan/elfproef_plan"
  s.summary     = "validate dutch social security- and bank-account- numbers"
  s.description = "validate dutch social security- and bank-account- numbers"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md", "changelog.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~>4.0"



  s.add_development_dependency 'minitest-rails'
  s.add_development_dependency 'minitest-spec-rails'
  s.add_development_dependency "jquery-ui-rails"
  s.add_development_dependency "jquery-rails"
  s.add_development_dependency "mysql2", "0.3.18"
  s.add_development_dependency "pry-rails"
  s.add_development_dependency 'coffee-rails', '~> 4.0'
  s.add_development_dependency "minitest-reporters"
  s.add_development_dependency 'color_pound_spec_reporter'

  s.add_development_dependency 'capybara' 
  s.add_development_dependency 'selenium-webdriver'

end
