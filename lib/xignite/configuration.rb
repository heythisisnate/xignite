module Xignite
  class Configuration
    attr_accessor :username, :https, :endpoint, :request_method, :format

    def initialize
      self.endpoint = Xignite::URL
      self.request_method = :get
      self.format = :xml
    end
  end
end