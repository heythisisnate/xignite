module Xignite
	class GlobalRealTime < Service

		operations [
			['GetGlobalRealTimeQuote', 	{}]
			['GetGlobalRealTimeQuotes', {}]
			['GetGlobalRealTimeVWAP', 	{}]
			['GetGlobalTick', 			{}]
			['GetGlobalTicks',			{}]
		]
	end
end