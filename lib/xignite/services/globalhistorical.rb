module Xignite
	class GlobalHistorical < Service
		operations [
			['GetGlobalLastClosingPrice', 				{}],
			['GetGlobalLastClosingPrices', 				{}],
			['GetEndOfDayQuotes', 						{}],
			['GetEndOfDayQuote', 						{}],
			['GetGlobalHistoricalQuote', 				{}],
			['GetGlobalHistoricalQuotes', 				{}],
			['GetGlobalHistoricalQuotesAsOf', 			{}],
			['GetGlobalHistoricalQuotesRange', 			{}],
			['GetGlobalHistoricalWeeklyQuotesRange', 	{}],
			['GetGlobalHistoricalMonthlyQuotesRange', 	{}],
			['GetGlobalHistoricalQuarterlyQuotesRange', {}],
			['GetSplitHistory', 						{}],
			['GetAllSplitsByExchange', 					{}],
			['GetSplitRatio', 							{}],
			['GetCashDividendHistory', 					{}],
			['GetCashDividendTotal', 					{}],
			['GetAllCashDividendsByExchange', 			{}],
			['GetTopMoversByExchange', 					{}],
			['GetTopLosersByExchange', 					{}],
			['GetTopGainersByExchange', 				{}],
			['GetGlobalHistoricalStatistics', 			{}]
		]
	end
end