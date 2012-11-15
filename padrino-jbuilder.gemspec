# -*- encoding: utf-8 -*-
require File.expand_path('../lib/padrino-jbuilder/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Andrew Janssen"]
  gem.email         = ["andrew.janssen@sardiusgroup.com"]
  gem.description   = %q{Adds the jbuilder templating engine to Padrino}
  gem.summary       = %q{Adds the jbuilder templating engine to Padrino}
  gem.homepage      = "https://github.com/thecurator/padrino-jbuilder"

  gem.add_dependency 'padrino'
  gem.add_dependency "jbuilder", "0.4.0"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "padrino-jbuilder"
  gem.require_paths = ["lib"]
  gem.version       = Padrino::Jbuilder::VERSION
end
