# -*- encoding: utf-8 -*-
require File.expand_path('../lib/omniauth-familysearch-identity/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ['Richard Hill']
  gem.email         = ['xrkhill@gmail.com']
  gem.description   = %q{OmniAuth strategy for FamilySearch Identity v2 API (OAuth 1.0a)}
  gem.summary       = %q{OmniAuth strategy for FamilySearch Identity v2 API (OAuth 1.0a)}
  gem.homepage      = 'https://github.com/xrkhill/omniauth-familysearch-identity'

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = 'omniauth-familysearch-identity'
  gem.require_paths = ['lib']
  gem.version       = Omniauth::Familysearch::VERSION

  gem.add_runtime_dependency('multi_json')
  gem.add_runtime_dependency('omniauth-oauth', '~> 1.0')

  gem.add_development_dependency('rspec', '~> 2.6')
end
