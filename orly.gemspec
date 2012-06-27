# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "orly/version"

Gem::Specification.new do |s|
  s.name        = "orly"
  s.version     = Orly::VERSION
  s.authors     = ["yon"]
  s.email       = ["yonatanbergman@gmail.com"]
  s.homepage    = "http://github.com/yonbergman/orly"
  s.summary     = %q{Tells you when you need to run `bundle install` or `rake db:migrate`}
  s.description = %q{Install a post-merge hook for git that tells you when the Gemfile changed or a migration was added}

  s.rubyforge_project = "orly"

  s.files         = `git ls-files`.split("\n") - ["Gemfile.lock"]
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  #s.add_development_dependency "rake"
  #s.add_development_dependency "rspec"
  s.add_runtime_dependency "git"
  s.add_runtime_dependency "choice"
  s.add_runtime_dependency "colored"
end