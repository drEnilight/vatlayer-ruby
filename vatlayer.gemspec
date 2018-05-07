lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require File.expand_path('../lib/vatlayer/version', __FILE__)

Gem::Specification.new do |spec|
  spec.name          = 'vatlayer'
  spec.version       = Vatlayer::VERSION
  spec.authors       = ['Vlad Romaniuk']
  spec.email         = ['romanuk_v@live.ru']

  spec.summary       = %q{A Ruby wrapper around vatlayer.com API}
  spec.description   = %q{A Ruby wrapper around vatlayer.com API.}
  spec.license       = 'MIT'


  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.required_ruby_version = '>= 1.9.3'
end