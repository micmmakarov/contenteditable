$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "contenteditable/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "contenteditable"
  s.version     = Contenteditable::VERSION
  s.authors     = ["Michael Makarov, Gabe Kopley"]
  s.email       = ["info1117@gmail.com"]
  s.homepage    = "http://coshx.com"
  s.summary     = "Gem that makes it easy to maintain the content"
  s.description = "Gem that makes it easy to maintain the content."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "readme.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.8"
  s.add_dependency "i18n-active_record"
  # s.add_dependency "jquery-rails"

  s.add_development_dependency "sqlite3"
end
