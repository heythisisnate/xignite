module Xignite
  class Service
    extend Xignite::Helpers
    include Xignite::Helpers

    class << self
      attr_accessor :options

      def post(options={})
        response = Curl::Easy.http_post(endpoint, *[].tap do |postbody|
          postbody << Curl::PostField.content('Header_Username', Xignite.configuration.username) if Xignite.configuration.username
          options.each do |key, value|
            postbody << Curl::PostField.content(key, value)
          end
        end)
        new(response)
      end

      def get(options={})
        options = options.merge('Header_Username' => Xignite.configuration.username) if Xignite.configuration.username
        querystring = options.map do |key, value|
          "#{CGI.escape(key.to_s).gsub(/%(5B|5D)/n) { [$1].pack('H*') }}=#{CGI.escape(value)}"
        end.sort * '&'
        response = Curl::Easy.http_get([endpoint, querystring].reject{|s| s == '' }.join('?'))
        new(response)
      end

      private
      
      def endpoint
        names = name.split('::')
        "#{protocol}://#{Xignite.configuration.endpoint}/x#{names[1]}.#{format}/#{names[2]}"
      end

      def protocol
        Xignite.configuration.https ? 'https' : 'http'
      end

      def format
        case Xignite.configuration.format
          when :json
            'json'
          when :xml
            'asmx'
          else
            'asmx'
        end
      end

      def operations(ops)
        ops.each do |operation, options|
          underscored_name = underscore(operation)
          const_set(operation, Class.new(self))
          const_get(operation).options = options
          class_eval <<-EOF
            class << self
              def #{underscored_name}(options={})
                #{name}::#{operation}.send(Xignite.configuration.request_method, options)
              end
              alias :#{operation} :#{underscored_name}
            end
          EOF
        end
      end
    end

    def initialize(curl_response=nil)
      return super if curl_response.nil?
      @raw = curl_response.body_str
      if Xignite.configuration.format == :json
        data = MultiJson.decode(@raw)
        if data.class.name == 'Array'
          build_collection(data)
        else
          weed(data)
        end
      else
        Crack::XML.parse(@raw).each do |klass, data|
          data = weed(data)
          Xignite.const_set(klass, Class.new(Xignite.const_get(data.class.to_s))) unless Xignite.const_defined?(klass)
          instance_variable_set("@#{underscore(klass)}", Xignite.const_get(klass).build(data, self.class.options))
          instance_eval "def #{underscore(klass)} ; @#{underscore(klass)} ; end"
        end
      end
    end

    private

    def weed(data)
      data.reject! { |key| key =~ /\Axmlns/ }
      key = data.keys.first
      array = data[key]
      if data.keys.size == 1 && array.class == ::Array
        Xignite.const_set(key, Class.new(Xignite::Hash)) unless Xignite.const_defined?(key)
        build_collection(array, Xignite.const_get(key))
      else
        data
      end
    end

    def build_collection(array, klass = Xignite::Hash)
      array.map do |hash|
        klass.build(hash, self.class.options)
      end
    end
  end
end