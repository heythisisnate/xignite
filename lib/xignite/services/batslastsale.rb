module Xignite
	class BATSLastSale < Service
		operations [
			['ListTradedSymbols', 			{}],
			['GetLastSale', 				{}],
			['GetLastSales', 				{}],
			['GetLastSaleByIdentifier',		{}],
			['GetLastSaleByIdentifiers', 	{}]
		]
	end
end