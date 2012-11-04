module Xignite
	class Quotes < Service

		operations [
			['GetQuickQuotes',				{}],
			['GetQuotes', 					{}],
			['GetQuotesByIdentifiers',		{}],
			['GetSingleQuote',				{}],
			['GetTickCollections',			{}],
			['GetTicks',					{}],
			['GetTick',						{}],
			['GetTickHistogram',			{}],
			['GetHistoricalTicksAsOfDate',	{}],
			['GetDelayedChart',				{}],
			['GetDelayedChartPreset',		{}],
			['GetDelayedChartCustom', 		{}],
			['GetChartDesign',				{}],
			['GetTop',						{}],
			['GetTopMovers',				{}],
			['GetTopLosers',				{}],
			['GetTopGainers',				{}],
			['GetTopsByExchange',			{}],
			['GetMarketSummary',			{}]
		]
	end
ends