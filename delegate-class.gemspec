# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "delegate/class/version"

Gem::Specification.new do |s|
  s.name        = "delegate-class"
  s.version     = Delegate::Class::VERSION
  s.authors     = ["Bruno Tavares"]
  s.email       = ["bruno.exz@gmail.com"]
  s.homepage    = "http://bltavares.com"
  s.summary     = %q{Wrap a whole class (including classes methods) into a delegate class}
  s.description = %q{Wrap a whole class (including classes methods) into a delegate class}

  s.rubyforge_project = "delegate-class"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
end
