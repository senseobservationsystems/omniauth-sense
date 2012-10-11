# -*- encoding: utf-8 -*-
require File.expand_path('../lib/omniauth-sense/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Ahmy Yulrizka"]
  gem.email         = ["ahmy@sense-os.nl"]
  gem.description   = %q{OmniAuth strategy for sense-os.nl}
  gem.summary       = %q{OmniAuth strategy for sense-os.nl}
  gem.homepage      = "https://github.com/yulrizka/omniauth-sense"

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "omniauth-sense"
  gem.require_paths = ["lib"]
  gem.version       = Omniauth::Sense::VERSION

  gem.add_runtime_dependency     'omniauth-oauth', '~> 1.0'
  gem.add_runtime_dependency     'multi_json', '~> 1.0'

  gem.add_development_dependency 'rspec', '~> 2.7'
  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'sinatra'
end
