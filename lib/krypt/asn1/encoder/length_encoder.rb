# encoding: BINARY

module Krypt::Asn1::Rb
  module LengthEncoder

    module_function

    def encode(length)
      return Length::INDEFINITE_LENGTH_MASK.chr if length.indefinite?

      len = length.length

      if len <= 127
        len.chr
      else
        complex_length(len)
      end
    end

    private; module_function

    def complex_length(len)
      bytes = length_bytes(len)
      # TODO raise error if bytes.size too large
      bytes.unshift(bytes.size | Length::INDEFINITE_LENGTH_MASK)
      bytes.pack('C*')
    end

    def length_bytes(len)
      return [0] if len == 0

      [].tap do |ary|
        while len > 0
          ary << (len & 0xff)
          len >>= 8
        end
      end
    end

  end
end

