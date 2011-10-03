require 'spec_helper'

describe Xignite do
  describe ".configure" do
    it "can be configured with a block" do
      Xignite.configure do |config|
        config.username = 'goldbug'
        config.https = true
      end

      Xignite.configuration.username.should == 'goldbug'
      Xignite.configuration.https.should be_true
    end
  end
end