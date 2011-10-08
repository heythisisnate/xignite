require 'spec_helper'

describe Xignite::Service do
  its('class.protocol') { should == 'http' }

  describe ".post" do
    let(:url) { 'http://www.xignite.com/xMetals.asmx/GetLastLondonFixing' }

    before do
      stub_request(:post, url).to_return(:status => 200, :body => "")
    end

    it "returns an instance of the service object" do
      Xignite::Metals::GetLastLondonFixing.post.should be_a(Xignite::Metals::GetLastLondonFixing)
    end
  end

  describe ".get" do

  end
end