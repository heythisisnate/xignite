require 'spec_helper'

describe Xignite::Service do
  its('class.protocol') { should == 'http' }

  describe ".post" do
    context "with no params" do
      before do
        @stub = stub_request(:post, 'http://www.xignite.com/xMetals.asmx/GetLastLondonFixing').to_return(:status => 200, :body => "")
      end

      it "makes the request and returns an instance of the service object" do
        Xignite::Metals::GetLastLondonFixing.post.should be_a(Xignite::Metals::GetLastLondonFixing)
        @stub.should have_been_requested
      end

      describe "when called with dynamic methods" do
        before do
          Xignite.configure{|c| c.request_method = :post }
        end

        after do
          Xignite.configure{|c| c.request_method = :get }
        end

        it "makes the request from the underscored name with the given parameters" do
          Xignite::Metals.get_last_london_fixing
          @stub.should have_been_requested
        end

        it "makes the request from the CamelCased name with the given parameters" do
          Xignite::Metals.GetLastLondonFixing
          @stub.should have_been_requested
        end
      end

    end

    context "with params" do
      before do
        @stub = stub_request(:post, 'www.xignite.com/xMetals.asmx/GetLastRealTimeMetalQuotes').with(
          'Types' => 'XAU,XAG,XPT',
          'Currency' => 'USD'
        )
      end

      it "makes the request with the given parameters" do
        Xignite::Metals::GetLastRealTimeMetalQuotes.post('Types' => 'XAU,XAG,XPT', 'Currency' => 'USD')
        @stub.should have_been_requested
      end

      describe "when called with dynamic methods" do
        before do
          Xignite.configure{|c| c.request_method = :post }
        end

        after do
          Xignite.configure{|c| c.request_method = :get }
        end

        it "makes the request from the underscored name with the given parameters" do
          Xignite::Metals.get_last_real_time_metal_quotes('Types' => 'XAU,XAG,XPT', 'Currency' => 'USD')
          @stub.should have_been_requested
        end

        it "makes the request from the CamelCased name with the given parameters" do
          Xignite::Metals.GetLastRealTimeMetalQuotes('Types' => 'XAU,XAG,XPT', 'Currency' => 'USD')
          @stub.should have_been_requested
        end
      end
    end
  end

  describe ".get" do
    context "with no params" do
      before do
        @stub = stub_request(:get, 'http://www.xignite.com/xMetals.asmx/GetLastLondonFixing').to_return(:status => 200, :body => "")
      end

      it "makes the request and returns an instance of the service object" do
        Xignite::Metals::GetLastLondonFixing.get.should be_a(Xignite::Metals::GetLastLondonFixing)
        @stub.should have_been_requested
      end

      describe "when called with dynamic methods" do
        it "makes the request from the underscored name with the given parameters" do
          Xignite::Metals.get_last_london_fixing
          @stub.should have_been_requested
        end

        it "makes the request from the CamelCased name with the given parameters" do
          Xignite::Metals.GetLastLondonFixing
          @stub.should have_been_requested
        end
      end

    end

    context "with params" do
      before do
        @stub = stub_request(:get, 'www.xignite.com/xMetals.asmx/GetLastRealTimeMetalQuotes?Currency=USD&Types=XAU,XAG,XPT')
      end

      it "makes the request with the given parameters" do
        Xignite::Metals::GetLastRealTimeMetalQuotes.get('Types' => 'XAU,XAG,XPT', 'Currency' => 'USD')
        @stub.should have_been_requested
      end

      describe "when called with dynamic methods" do
        it "makes the request from the underscored name with the given parameters" do
          Xignite::Metals.get_last_real_time_metal_quotes('Types' => 'XAU,XAG,XPT', 'Currency' => 'USD')
          @stub.should have_been_requested
        end

        it "makes the request from the CamelCased name with the given parameters" do
          Xignite::Metals.GetLastRealTimeMetalQuotes('Types' => 'XAU,XAG,XPT', 'Currency' => 'USD')
          @stub.should have_been_requested
        end
      end
    end
  end

  it "defines a class for each request operation" do
    Xignite::Metals.const_defined?('GetLastRealTimeMetalQuote').should be_true
    Xignite::Metals::GetLastRealTimeMetalQuote.options[:timezone].should == 'Europe/London'
  end

end