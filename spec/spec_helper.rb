require File.expand_path('lib/xignite.rb')
require 'webmock/rspec'
require 'awesome_print'
require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/fixtures/vcr'
  c.hook_into :webmock
  c.configure_rspec_metadata!
end

RSpec.configure do |c|
  # so we can use `:vcr` rather than `:vcr => true`;
  # in RSpec 3 this will no longer be necessary.
  c.treat_symbols_as_metadata_keys_with_true_values = true
end

def fixture_file(filename)
  File.read(File.join(File.dirname(__FILE__), 'fixtures', filename))
end

Xignite.configure do |config|
  config.username = 'nate@nateclark.com'
end