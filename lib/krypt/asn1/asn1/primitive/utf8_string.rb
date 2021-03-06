# encoding: BINARY

module Krypt::Asn1
  class Utf8String < Primitive

    def self.default_tag
      UTF8_STRING
    end

    def parse_value(bytes)
      bytes.dup.force_encoding(Encoding::UTF_8)
    end

    def encode_value(value)
      if value.encoding.ascii_compatible?
        value.dup.force_encoding(Encoding::UTF_8)
      else
        value.encode(Encoding::UTF_8)
      end
    end

  end
end

