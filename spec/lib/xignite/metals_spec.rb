require 'spec_helper'

describe Xignite::Metals do
  describe Xignite::Metals::GetLastRealTimeMetalQuotes do
    before do
      @stub = stub_request(:post, 'www.xignite.com/xMetals.asmx/GetLastRealTimeMetalQuotes').with(
        'Types' => 'XAU,XAG,XPT',
        'Currency' => 'USD'
      )
    end

    it "makes the request with the given parameters" do
      Xignite::Metals.get_last_real_time_metal_quotes('Types' => 'XAU,XAG,XPT', 'Currency' => 'USD')
      @stub.should have_been_requested
    end

    it "makes the request with the given parameters" do
      Xignite::Metals::GetLastRealTimeMetalQuotes.post('Types' => 'XAU,XAG,XPT', 'Currency' => 'USD')
      @stub.should have_been_requested
    end

    it "defines a class for each request operation" do
      Xignite::Metals.const_defined?('GetLastRealTimeMetalQuote').should be_true
      Xignite::Metals::GetLastRealTimeMetalQuote.options[:timezone].should == 'Europe/London'
    end

    it "makes the request from the CamelCased name the given parameters" do
      Xignite::Metals.GetLastRealTimeMetalQuotes('Types' => 'XAU,XAG,XPT', 'Currency' => 'USD')
      @stub.should have_been_requested
    end
  end

  describe "responses" do
    before do
      stub_request(:post, url).to_return(:status => 200, :body => body)
    end

    describe Xignite::Metals::GetLastRealTimeMetalQuotes do
      subject { Xignite::Metals::GetLastRealTimeMetalQuotes.post }
      let(:url) { 'http://www.xignite.com/xMetals.asmx/GetLastRealTimeMetalQuotes' }

      context "in London standard time (BST)" do
        let(:body) { fixture_file('metals/GetLastRealTimeMetalQuotes.xml') }

        describe "#array_of_metal_quote" do
          it "automatically defines the response classes" do
            subject
            defined?(Xignite::ArrayOfMetalQuote).should be_true
          end

          it "is automatically defined" do
            array = subject.array_of_metal_quote
            array.should be_a(Xignite::ArrayOfMetalQuote)
            array.should be_kind_of(Array)
          end

          it "contains three MetalQuote Hashes with smart types" do
            a = subject.array_of_metal_quote
            a.should have(3).items
            a.each do |item|
              item.should             be_a(Xignite::MetalQuote)
              item.should             be_kind_of(Hash)
              item['outcome'].should  be_a(String)
              item['identity'].should be_a(String)
              item['delay'].should    be_a(Float)
              item['symbol'].should   be_a(String)
              item['currency'].should be_a(String)
              item['date'].should     be_a(Date)
              item['time'].should     be_a(Time)
              item['rate'].should     be_a(Float)
              item['bid'].should      be_a(Float)
              item['ask'].should      be_a(Float)
              item['bid_time'].should be_a(Time)
              item['ask_time'].should be_a(Time)
            end
          end

          it "maintains data integrity" do
            quote = subject.array_of_metal_quote.first
            quote['outcome'].should  == 'Success'
            quote['identity'].should == 'Request'
            quote['delay'].should    == 0.015625
            quote['symbol'].should   == 'XAUUSDO'
            quote['type'].should     == 'XAU'
            quote['currency'].should == 'USD'
            quote['date'].should     == Date.new(2010, 1, 22)
            quote['time'].should     == Time.new(2010, 1, 22, 22, 15, 15, 0)
            quote['rate'].should     == 1092.59997559
            quote['bid'].should      == 1091.59997559
            quote['bid_time'].should == Time.new(2010, 1, 22, 22, 15, 15, 0)
            quote['ask'].should      == 1093.59997559
            quote['ask_time'].should == Time.new(2010, 1, 22, 22, 15, 15, 0)
          end

          it "parses the time in the correct time zone" do
            subject.array_of_metal_quote.first['time'].should == Time.strptime("1/22/2010 10:15:15 PM +00:00", "#{Xignite::DATE_FORMAT} #{Xignite::TIME_FORMAT} %z")
          end
        end

      end

      context "in London Daylight time (BDT)" do
        let(:body) { fixture_file('metals/GetLastRealTimeMetalQuotes-BDT.xml') }

        describe "#array_of_metal_quote" do
          it "parses the time in the correct time zone" do
            subject.array_of_metal_quote.first['time'].should == Time.strptime("5/6/2011 10:59:56 PM +01:00", "#{Xignite::DATE_FORMAT} #{Xignite::TIME_FORMAT} %z")
          end
        end
      end
    end

    describe Xignite::Metals::GetLastRealTimeMetalQuoteGMT do
      subject { Xignite::Metals::GetLastRealTimeMetalQuoteGMT.post }
      let(:url) { 'http://www.xignite.com/xMetals.asmx/GetLastRealTimeMetalQuoteGMT' }
      let(:body) { fixture_file('metals/GetLastRealTimeMetalQuoteGMT.xml') }
      let(:item) { subject.metal_quote }

      describe "#metal_quote" do
        it "returns a MetalQuote Hash with smart types" do
          item.should             be_a(Xignite::MetalQuote)
          item.should             be_kind_of(Hash)
          item['outcome'].should  be_a(String)
          item['identity'].should be_a(String)
          item['delay'].should    be_a(Float)
          item['symbol'].should   be_a(String)
          item['currency'].should be_a(String)
          item['date'].should     be_a(Date)
          item['time'].should     be_a(Time)
          item['rate'].should     be_a(Float)
          item['bid'].should      be_a(Float)
          item['ask'].should      be_a(Float)
          item['bid_time'].should be_a(Time)
          item['ask_time'].should be_a(Time)
        end

        it "parses times in GMT time" do
          item['time'].should == Time.new(2011, 9, 30, 21, 59, 56, 0)
        end
      end
    end

    describe Xignite::Metals::GetLastLondonFixing do
      subject { Xignite::Metals::GetLastLondonFixing.post }
      let(:url) { 'http://www.xignite.com/xMetals.asmx/GetLastLondonFixing' }
      let(:body) { fixture_file('metals/GetLastLondonFixing.xml') }

      describe "#london_fixing" do
        it "returns a LondonFixing Hash with smart types" do
          item = subject.london_fixing
          item.should be_a(Xignite::LondonFixing)
          item.should be_kind_of(Hash)

          item['outcome'].should  be_a(String)
          item['identity'].should be_a(String)
          item['delay'].should    be_a(Float)
          item['type'].should     be_a(String)
          item['symbol'].should   be_a(String)
          item['currency'].should be_a(String)
          item['period'].should   be_a(String)
          item['date'].should     be_a(Date)
          item['value'].should    be_a(Float)
          item['unit'].should     be_a(String)
          item['source'].should   be_a(String)
        end

        it "maintains data integrity" do
          item = subject.london_fixing
          item['outcome'].should  == 'Success'
          item['identity'].should == 'Cookie'
          item['delay'].should    == 0.001
          item['type'].should     == 'LondonGold'
          item['symbol'].should   == 'AU'
          item['currency'].should == 'USD'
          item['period'].should   == 'Evening'
          item['date'].should     == Date.new(2011, 9, 30)
          item['value'].should    == 1620.0
          item['unit'].should     == 'oz'
          item['source'].should   == 'The London Bullion Market Association'
        end
      end
    end

    describe Xignite::Metals::GetLastLondonFixings do
      subject { Xignite::Metals::GetLastLondonFixings.post }
      let(:url) { 'http://www.xignite.com/xMetals.asmx/GetLastLondonFixings' }
      let(:body) { fixture_file('metals/GetLastLondonFixings.xml') }

      describe "#array_of_london_fixing" do
        it "is automatically defined" do
          array = subject.array_of_london_fixing
          array.should be_a(Xignite::ArrayOfLondonFixing)
          array.should be_kind_of(Array)
        end

        it "contains 4 LondonFixing Hashes with smart types" do
          a = subject.array_of_london_fixing
          a.should have(4).items
          a.each do |item|
            item['outcome'].should  be_a(String)
            item['identity'].should be_a(String)
            item['delay'].should    be_a(Float)
            item['type'].should     be_a(String)
            item['symbol'].should   be_a(String)
            item['currency'].should be_a(String)
            item['period'].should   be_a(String)
            item['date'].should     be_a(Date)
            item['value'].should    be_a(Float)
            item['unit'].should     be_a(String)
            item['source'].should   be_a(String)
          end
        end
      end
    end

    describe Xignite::Metals::GetMetalSpotChart do
      subject { Xignite::Metals::GetMetalSpotChart.post }
      let(:url) { 'http://www.xignite.com/xMetals.asmx/GetMetalSpotChart' }
      let(:body) { fixture_file('metals/GetMetalSpotChart.xml') }

      describe "#historical_chart" do
        it "is automatically defined" do
          chart = subject.historical_chart
          chart.should be_a(Xignite::HistoricalChart)
          chart.should be_kind_of(Hash)
        end
      end

    end
  end

end