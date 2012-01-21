# -*- encoding: utf-8 -*-
require File.expand_path('../lib/datalogger/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Michael Gorsuch"]
  gem.email         = ["michael.gorsuch@gmail.com"]
  gem.description   = %q{Easy to use structured data logger}
  gem.summary       = %q{Structurd data logger}
  gem.homepage      = "https://github.com/gorsuch/datalogger"

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "datalogger"
  gem.require_paths = ["lib"]
  gem.version       = DataLogger::VERSION
end
