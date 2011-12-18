[![Build Status](https://secure.travis-ci.org/heythisisnate/xignite.png)](http://travis-ci.org/heythisisnate/xignite)

### Xignite Ruby

Xignite is a Ruby client library for the [Xignite Web Services API](http://xignite.com)

This gem only supports a subset of Xignite's Web Services. **Currently Supported** are all operations under:

  * [Currencies](http://www.xignite.com/xCurrencies.asmx)
  * [Metals](http://www.xignite.com/xMetals.asmx)

## Installation ##

    gem install xignite
    require 'xignite'

or with Bundler, simply add to your Gemfile:

    gem 'xignite'

## Basic Usage ##

*Xignite Ruby* provides a rubyist's interface to the Xignite API. It constructs a GET or POST request for you, and then parses the response into Array and Hash-like Ruby objects. Reference the Xignite documentation for required parameters and options, then call the appropriate Web Service in one of two ways:

    # The following two statements do the same thing
    response = Xignite::Metals.get_last_real_time_metal_quote(
      'Type' => 'XAU', 'Currency' => 'USD'
    )

    response = Xignite::Metals::GetLastRealTimeMetalQuote(
      'Type' => 'XAU', 'Currency' => 'USD'
    )

The response is a `Xignite::Metals::GetLastRealTimeMetalQuote` object:

    #<Xignite::Metals::GetLastRealTimeMetalQuote:0x007fbbc3a648f8
      @metal_quote={
        "outcome"=>"Success",
        "identity"=>"Request",
        "delay"=>0.006,
        "symbol"=>"XAUUSDO",
        "type"=>"XAU",
        "currency"=>"USD",
        "date"=>#<Date: 2011-12-09 (4911809/2,0,2299161)>,
        "time"=>2011-12-09 22:59:52 UTC,
        "rate"=>1711.42498779,
        "bid"=>1710.69995117,
        "bid_time"=>2011-12-09 22:59:52 UTC,
        "ask"=>1712.15002441,
        "ask_time"=>2011-12-09 22:59:52 UTC
      }>

Numeric values are automatically converted to `Float` objects

    response.metal_quote['ask']
    # => 1712.15002441

Times are automatically converted into `DateTime` objects with the appropriate time zone (if known)

    response.metal_quote['time']
    # => 2011-12-09 22:59:52 UTC

Dates are automatically converted into `Date` objects

    response.metal_quote['date']
    # => #<Date: 2011-12-09 (4911809/2,0,2299161)>

## Configuration ##

    Xignite.configure do |config|

      # Configure which HTTP method is used to contact the Xignite service
      # Default: :get, Possible values: [ :get, :post ]
      config.request_method = :get

      # Configure the endpoint hostname
      # Default: www.xignite.com
      config.endpoint = Xignite::URL

      # Use HTTPS
      # Default: false
      config.https = true

      # Set your Xignite username. This automatically adds a 'Header_Username' parameter to all requests as required.
      # Default: nil
      config.username = 'goldbug'
    end

## Contributing ##

To add support for additional web services or features, simply extend from the `Xignite::Service`. Pull requests are encouraged and will be considered promptly.

[Issues/Requests](https://github.com/heythisisnate/xignite/issues)

## In the Wild ##

Xignite Ruby was originally written and maintained for the [GoldBug](http://goldb.ug) app. Issue a pull request or let us know if you'd like your site/company link added here.

## Disclaimer ##

The author of this software is not affiliated with Xignite and cannot provide support for Xignite products and services.

## License ##

Copyright (c) 2011 Nate Clark, Irregular Expression LLC

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
