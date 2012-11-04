module Xignite
	class RealTime < Service

		operations [
			['GetRealQuote', 				{}],
			['GetRealQuotes', 				{}],
			['GetRealQuoteByIdentifier', 	{}],
			['GetExtendedRealQuote',		{}],
			['GetExtendedRealQuotes', 		{}],
			['GetRealQuotesTicker', 		{}],
			['GetTickCollections', 			{}],
			['GetTicks', 					{}],
			['GetTick', 					{}],
			['GetHistoricalTicksAsOfDate', 	{}],
			['GetRealChart', 				{}],
			['GetRealChartPreset', 			{}],
			['GetRealChartCustom', 			{}],
			['GetChartDesign', 				{}],
			['GetExchangeTime', 			{}]
		]
	end
end