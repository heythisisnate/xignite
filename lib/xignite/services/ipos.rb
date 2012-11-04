module Xignite
	class IPOs < Service
		operations [
			['ListExchanges', 				{}],
			['SearchIPOBySymbol', 			{}],
			['SearchIPOByName', 			{}],
			['GetIPOCalendar', 				{}],
			['GetIPOList', 					{}],
			['GetIPOCalendarByExchange', 	{}],
			['GetIPOByStatus', 				{}],
			['GetIPO', 						{}],
			['GetIPODetails', 				{}],
			['GetIPOPerformance', 			{}]
		]
	end
end