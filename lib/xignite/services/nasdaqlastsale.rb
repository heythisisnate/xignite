module Xignite
	class NASDAQLastSale < Service
		operations [
			['GetLastSale', 			{}],
			['GetLastSales', 			{}],
			['GetLastSaleByIdentifier', {}],
			['GetLastSaleChart', 		{}],
			['GetLastSaleChartPreset', 	{}],
			['GetLastSaleChartCustom', 	{}],
			['GetChartDesign', 			{}]
		]
	end
end