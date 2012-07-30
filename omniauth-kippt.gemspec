# encoding: utf-8
require File.expand_path('../lib/omniauth-kippt/version', __FILE__)

Gem::Specification.new do |gem|
  gem.add_dependency 'omniauth', '~> 1.0'
  gem.add_dependency 'omniauth-http-basic', '~> 1.0'
  gem.add_dependency 'nokogiri'

  gem.add_development_dependency 'rspec', '~> 2.7'
  gem.add_development_dependency 'rack-test'
  gem.add_development_dependency 'simplecov'
  gem.add_development_dependency 'webmock'
  gem.add_development_dependency 'yard'

  gem.authors = ['Jan Xie']
  gem.email = ['jan.h.xie@gmail.com']
  gem.description = %q{Kippt strategy for OmniAuth.}
  gem.summary = gem.description
  gem.homepage = 'http://github.com/janx/omniauth-kippt'

  gem.name = 'omniauth-kippt'
  gem.require_paths = ['lib']
  gem.files = `git ls-files`.split("\n")
  gem.test_files = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.version = OmniAuth::Kippt::VERSION
end
