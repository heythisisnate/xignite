require 'spec_helper'

describe Xignite::Metals, :vcr do

  describe Xignite::Metals::GetLastRealTimeMetalQuotes do
    subject { Xignite::Metals::GetLastRealTimeMetalQuotes.get('Types' => 'XAU,XAG,XPT', 'Currency' => 'USD') }

    context "in London standard time (BST)" do
      describe "requesting XML" do
        before do
          Xignite.configuration.format = :xml
        end

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
          raw = Crack::XML.parse(subject.instance_variable_get(:@raw))
          quote['outcome'].should  == raw['ArrayOfMetalQuote']['MetalQuote'][0]['Outcome']
          quote['identity'].should == raw['ArrayOfMetalQuote']['MetalQuote'][0]['Identity']
          quote['delay'].should    == raw['ArrayOfMetalQuote']['MetalQuote'][0]['Delay'].to_f
          quote['symbol'].should   == raw['ArrayOfMetalQuote']['MetalQuote'][0]['Symbol']
          quote['type'].should     == raw['ArrayOfMetalQuote']['MetalQuote'][0]['Type']
          quote['currency'].should == raw['ArrayOfMetalQuote']['MetalQuote'][0]['Currency']
          quote['rate'].should     == raw['ArrayOfMetalQuote']['MetalQuote'][0]['Rate'].to_f
          quote['bid'].should      == raw['ArrayOfMetalQuote']['MetalQuote'][0]['Bid'].to_f
          quote['ask'].should      == raw['ArrayOfMetalQuote']['MetalQuote'][0]['Ask'].to_f
        end

        it "parses the time in the correct time zone" do
          raw_data = Crack::XML.parse(subject.instance_variable_get(:@raw))
          date, time = raw_data['ArrayOfMetalQuote']['MetalQuote'][0]['Date'], raw_data['ArrayOfMetalQuote']['MetalQuote'][0]['Time']
          subject.array_of_metal_quote.first['time'].should == Time.strptime("#{date} #{time} +00:00", "#{Xignite::DATE_FORMAT} #{Xignite::TIME_FORMAT} %z")
        end
      end

      describe "requesting JSON" do
        before do
          Xignite.configure{|c| c.format = :json }
        end

        after do
          Xignite.configure{|c| c.format = :xml }
        end

        it "contains three Hashes with smart types" do
          subject.should be_kind_of(Array)
          subject.should have(3).items
          subject.each do |item|
            item.should             be_kind_of(Hash)
            item['outcome'].should  be_a(String)
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

      end

    end

    context "in London Daylight time (BDT)" do
      describe "#array_of_metal_quote" do
        it "parses the time in the correct time zone" do
          subject.array_of_metal_quote.first['time'].should == Time.strptime("5/6/2011 10:59:56 PM +01:00", "#{Xignite::DATE_FORMAT} #{Xignite::TIME_FORMAT} %z")
        end
      end
    end
  end

  describe Xignite::Metals::GetLastRealTimeMetalQuoteGMT do
    subject { Xignite::Metals::GetLastRealTimeMetalQuoteGMT.get('Type' => 'XAU', 'Currency' => 'USD') }
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
        raw_data = Crack::XML.parse(subject.instance_variable_get(:@raw))
        date, time = raw_data['MetalQuote']['Date'], raw_data['MetalQuote']['Time']
        item['time'].should ==Time.strptime("#{date} #{time} +00:00", "#{Xignite::DATE_FORMAT} #{Xignite::TIME_FORMAT} %z")
      end
    end
  end

  describe Xignite::Metals::GetLastLondonFixing do
    subject { Xignite::Metals::GetLastLondonFixing.get('Type' => 'LondonGold', 'Currency' => 'USD') }

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

    end
  end

  describe Xignite::Metals::GetLastLondonFixings do
    subject { Xignite::Metals::GetLastLondonFixings.get('Currency' => 'USD') }

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
    subject {
      Xignite::Metals::GetMetalSpotChart.get(
        'Type' => 'XAU',
        'Currency' => 'USD',
        'StartDate' => '12/07/2011',
        'EndDate' => '12/08/2011',
        'Style' => 'Line',
        'DaysForHourDisplay' => '1',
        'DaysForDayDisplay' => '14',
        'DaysForWeekDisplay' => '62',
        'DaysForBiWeeklyDisplay' => '91',
        'DaysForMonthDisplay' => '186',
        'DaysForQuarterDisplay' => '365',
        'DaysForSemiAnnualDisplay' => '1000',
        'DaysForAnnualDisplay' => '1000',
        'DaysForBiAnnualDisplay' => '14',
        'DaysForPentaAnnualDisplay' => '3500',
        'Width' => '600',
        'Height' => '400',
        'Preset' => 'Demo'
      )
    }

    describe "#historical_chart" do
      it "is automatically defined" do
        chart = subject.historical_chart
        chart.should be_a(Xignite::HistoricalChart)
        chart.should be_kind_of(Hash)
      end
    end
  end

end