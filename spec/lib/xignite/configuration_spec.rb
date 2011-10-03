require 'spec_helper'

describe Xignite::Configuration do
  its(:username) { should be_nil }
  its(:https) { should be_false }
  its(:endpoint) { should == 'www.xignite.com' }
end