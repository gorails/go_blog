$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "go_blog/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "go_blog"
  s.version     = GoBlog::VERSION
  s.authors     = ["João Carlos Ottobboni"]
  s.email       = ["jcottobboni@gmail.com"]
  s.homepage    = "http://www.gorails.com.br"
  s.summary     = "blog engine"
  s.description = "blog engine"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "draper"
  s.add_dependency "rails"
  s.add_dependency "rspec-rails", "~> 3.7.1"

end
