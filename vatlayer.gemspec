# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require File.expand_path('lib/vatlayer/version', __dir__)

Gem::Specification.new do |spec|
  spec.name          = 'vatlayer'
  spec.version       = Vatlayer::VERSION
  spec.authors       = ['Vlad Romaniuk']
  spec.email         = ['romanuk_v@live.ru']

  spec.summary       = 'A Ruby wrapper around vatlayer.com API'
  spec.description   = 'A Ruby wrapper around vatlayer.com API.'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'http', '~> 4.2'

  spec.add_development_dependency 'bundler', '~> 2.1'
  spec.add_development_dependency 'codecov'
  spec.add_development_dependency 'rake', '>= 12.3.3'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop', '~> 0.54'
  spec.required_ruby_version = '>= 2.4'
end
