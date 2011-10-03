module Xignite
  class Configuration
    attr_accessor :username, :https, :endpoint

    def initialize
      self.endpoint = 'www.xignite.com'
    end
  end
end