require 'cgi'
require 'crack'
require 'curl'
require 'tzinfo'
require 'xignite/configuration'

module Xignite
  URL = 'www.xignite.com'
  DATE_FORMAT = '%m/%d/%Y'
  TIME_FORMAT = '%I:%M:%S %p'

  class << self
    def configuration
      @configuration ||= Xignite::Configuration.new
    end

    def configure
      yield configuration if block_given?
    end
  end
end

require 'xignite/helpers'
require 'xignite/hash'
require 'xignite/array'
require 'xignite/service'

# Equities
require 'xignite/services/alphacanadianrealtime'
require 'xignite/services/batslastsale'
require 'xignite/services/batsrealtime'
require 'xignite/services/globalhistorical'
require 'xignite/services/globalquotes'
require 'xignite/services/globalrealtime'
require 'xignite/services/historical'
require 'xignite/services/ipos'
require 'xignite/services/nasdaqlastsale'
require 'xignite/services/quotes'
require 'xignite/services/realtime'


# Forex & Metals
require 'xignite/services/currencies'
require 'xignite/services/metals'