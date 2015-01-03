require_relative 'integer_codec'

module Krypt::Asn1
  class Integer < Primitive
    include IntegerCodec

    def self.default_tag
      INTEGER
    end

  end
end

