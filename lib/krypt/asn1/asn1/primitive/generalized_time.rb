require 'time'

module Krypt::Asn1
  class GeneralizedTime < Primitive

    def parse_value(bytes)
      DateTime.strptime(value, "%Y%m%d%H%M%S%Z")
    end

    def encode_value(value)
      value.to_time.utc.strftime("%Y%m%d%H%M%SZ")
    end

    def default_tag
      GENERALIZED_TIME
    end
    
  end
end

