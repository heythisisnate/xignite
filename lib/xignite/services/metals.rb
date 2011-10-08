module Xignite
  class Metals < Service

    operations [
      ['GetLastLondonFixing',                 {}],
      ['GetLastLondonFixings',                {}],
      ['GetHistoricalLondonFixing',           {}],
      ['GetHistoricalLondonFixingRange',      {}],
      ['GetLastRealTimeMetalQuote',           { :timezone => 'Europe/London' }],
      ['GetLastRealTimeExtendedMetalQuote',   { :timezone => 'Europe/London' }],
      ['GetLastRealTimeMetalQuotes',          { :timezone => 'Europe/London' }],
      ['GetLastRealTimeMetalQuoteGMT',        {}],
      ['GetLastRealTimeMetalQuotesGMT',       {}],
      ['GetRealTimeMetalQuote',               { :timezone => 'Europe/London' }],
      ['GetRealTimeMetalQuotes',              { :timezone => 'Europe/London' }],
      ['GetHistoricalSpotPrice',              {}],
      ['GetHistoricalSpotPrices',             {}],
      ['GetHistoricalSpotPriceRange',         {}],
      ['GetDelayedMetalFuture',               {}],
      ['GetAllDelayedMetalFutures',           {}],
      ['GetHistoricalMetalFuture',            {}],
      ['GetHistoricalMetalFutureRange',       {}],
      ['GetMetalSpotChart',                   {}],
      ['GetMetalSpotChartCustom',             {}],
      ['GetMetalSpotChartDesign',             {}],
      ['GetLondonFixingChart',                {}],
      ['GetLondonFixingChartPreset',          {}],
      ['GetLondonFixingChartCustom',          {}],
      ['GetIntradayMetalFutureChart',         {}],
      ['GetIntradayMetalFutureChartCustom',   {}],
      ['GetIntradayMetalFutureChartDesign',   {}],
      ['GetHistoricalMetalFutureChart',       {}],
      ['GetHistoricalFutureMetalChartCustom', {}],
      ['GetHistoricalMetalFutureChartDesign', {}],
      ['GetLastBasePrice',                    {}],
      ['GetSpotMarketSummary',                {}],
      ['GetTicks',                            {}],
      ['GetTick',                             {}],
      ['GetTopIndustryHeadlines',             {}]
    ]

  end
end
