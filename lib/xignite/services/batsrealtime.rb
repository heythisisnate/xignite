module Xignite
	class BATSRealTime < Service
		operations [
			['ListTradedSymbols', 	{}]
			['GetRealQuote', 		{}]
			['GetRealQuotes', 		{}]
			['GetTick', 			{}]
			['GetTicks', 			{}]
			['GetChart', 			{}]
			['GetChartPreset', 		{}]
			['GetChartCustom', 		{}]
			['GetChartDesign', 		{}]
		]
	end
end