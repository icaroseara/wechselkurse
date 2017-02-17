$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'wechselkurse'
require 'simplecov'
require 'vcr'

SimpleCov.start

VCR.configure do |config|
  config.cassette_library_dir = 'spec/cassettes'
  config.hook_into :webmock
end
