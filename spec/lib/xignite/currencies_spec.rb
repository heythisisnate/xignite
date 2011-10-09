require 'spec_helper'

describe Xignite::Currencies::GetRealTimeCrossRate do
  before do
    stub_request(:post, url).to_return(:status => 200, :body => body)
  end

  subject { Xignite::Currencies::GetRealTimeCrossRate.post }
  let(:url) { 'http://www.xignite.com/xCurrencies.asmx/GetRealTimeCrossRate' }
  let(:body) { fixture_file('currencies/GetRealTimeCrossRate.xml') }

  describe "#cross_rate" do
    it "is automatically defined" do
      rate = subject.cross_rate
      rate.should be_a(Xignite::CrossRate)
      rate.should be_kind_of(Hash)
      rate['to']['symbol'].should == 'EUR'
    end
  end

end