module Xignite
  class Array < ::Array
    extend Xignite::Helpers

    def self.build(data, options={})
      new(data)
    end
  end
end
