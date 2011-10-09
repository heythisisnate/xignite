module Xignite
  class Hash < ::Hash
    extend Xignite::Helpers
    
    def self.build(data, options={})
      new.tap do |obj|
        data.each do |k, v|
          v = self.build(v, options) if v.class.name == 'Hash'
          obj[underscore(k)] = case v
            when /^[\d,\.]+$/
              v.to_f
            when /^[\d,\/]+$/
              Date.strptime(v, '%m/%d/%Y')
            when /^\d+:\d+:\d+ [APM]{2}$/
              tz = ::TZInfo::Timezone.get(options[:timezone] || 'GMT')
              tz.local_to_utc(Time.strptime("#{data['Date']} #{v}", "#{DATE_FORMAT} #{TIME_FORMAT}"))
            else
              v
          end
        end
      end
    end
  end
end