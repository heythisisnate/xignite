require 'spec_helper'

describe Xignite::Service do
  its('class.protocol') { should == 'http' }

  describe ".post" do
    let(:url) { 'https://www.xignite.com/xMetals.asmx/Example' }

    before do
      stub_request(:post, url).to_return(:status => 200, :body => "")
    end

    it "returns an instance of the service object" do
      Xignite::Metals::GetLastLondonFixing.post(url).should be_a(Xignite::Metals::GetLastLondonFixing)
    end

  end
end