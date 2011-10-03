require File.expand_path('lib/xignite.rb')
require 'webmock/rspec'
require 'awesome_print'

def fixture_file(filename)
  File.read(File.join(File.dirname(__FILE__), 'fixtures', filename))
end