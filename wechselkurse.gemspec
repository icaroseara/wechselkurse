# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'wechselkurse/version'

Gem::Specification.new do |spec|
  spec.name          = 'wechselkurse'
  spec.version       = Wechselkurse::VERSION
  spec.authors       = ['Icaro Seara']
  spec.email         = ['icaro.seara@gmail.com']

  spec.summary       = %q{Wechselkurse is a Ruby wrapper and CLI for some APIs of currency exchange rates.}
  spec.description   = %q{Wechselkurse is a Ruby wrapper and CLI for some APIs of currency exchange rates.}
  spec.homepage      = 'https://github.com/icaroseara/wechselkurse'

  spec.files         = `git ls-files -z`.split('\x0').reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'httparty'

  spec.add_development_dependency 'bundler', '~> 1.10'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency('pry')
  spec.add_development_dependency('simplecov')
  spec.add_development_dependency('rubocop')
  spec.add_development_dependency('vcr')
  spec.add_development_dependency('money')
  spec.add_development_dependency('webmock')
  spec.add_development_dependency('slack-notifier')
end
