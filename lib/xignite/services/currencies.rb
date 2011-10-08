module Xignite
  class Currencies < Service

    operations [
      ['ListCurrencies',                      {}],
      ['GetRealTimeCrossRate',                { :timezone => 'Europe/London' }],
      ['GetRealTimeCrossRateGMT',             {}],
      ['GetRealTimeCrossRateAsString',        { :timezone => 'Europe/London' }],
      ['GetLatestCrossRate',                  { :timezone => 'Europe/London' }],
      ['GetLatestCrossRates',                 { :timezone => 'Europe/London' }],
      ['GetRealTimeCrossRateTable',           { :timezone => 'Europe/London' }],
      ['GetRealTimeCrossRateTableAsHTML',     {}],
      ['GetRealTimeCrossRateTableWithBidAsk', { :timezone => 'Europe/London' }],
      ['GetHistoricalCrossRate',              { :timezone => 'Europe/London' }],
      ['GetHistoricalCrossRates',             { :timezone => 'Europe/London' }],
      ['GetHistoricalCrossRatesAsOf',         { :timezone => 'Europe/London' }],
      ['GetHistoricalCrossRatesRange',        { :timezone => 'Europe/London' }],
      ['GetHistoricalCrossRateBidAsk',        { :timezone => 'Europe/London' }],
      ['GetHistoricalCrossRatesBidAsk',       { :timezone => 'Europe/London' }],
      ['GetHistoricalCrossRatesBidAskAsOf',   { :timezone => 'Europe/London' }],
      ['GetHistoricalCrossRatesBidAskRange',  { :timezone => 'Europe/London' }],
      ['GetHistoricalMonthlyCrossRatesRange', { :timezone => 'Europe/London' }],
      ['GetHistoricalCrossRateTable',         { :timezone => 'Europe/London' }],
      ['GetHistoricalCrossRateTables',        { :timezone => 'Europe/London' }],
      ['GetOfficialCrossRate',                { :timezone => 'Europe/London' }],
      ['GetOfficialCrossRates',               { :timezone => 'Europe/London' }],
      ['GetAllCrossRatesForACurrency',        { :timezone => 'Europe/London' }],
      ['GetCurrencyReport',                   { :timezone => 'Europe/London' }],
      ['GetAverageHistoricalCrossRate',       { :timezone => 'Europe/London' }],
      ['GetAverageHistoricalCrossRates',      { :timezone => 'Europe/London' }],
      ['GetRealTimeForwardRate',              { :timezone => 'Europe/London' }],
      ['ConvertRealTimeValue',                { :timezone => 'Europe/London' }],
      ['ConvertHistoricalValue',              { :timezone => 'Europe/London' }],
      ['GetCurrencyChart',                    {}],
      ['GetCurrencyChartCustom',              {}],
      ['GetChartDesign',                      {}],
      ['GetTicks',                            {}],
      ['GetTick',                             {}],
      ['GetHistoricalHighLow',                {}],
      ['GetIntradayHighLow',                  {}],
      ['GetCrossRateChange',                  {}]
    ]
  end
end
