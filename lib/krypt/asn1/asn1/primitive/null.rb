# encoding: BINARY

module Krypt::Asn1
  class Null < Primitive

    def initialize
      super(tag: Der::Tag::NULL, tag_class: :UNIVERSAL)
    end

    def parse_value(bytes)
      raise "NULL must not contain a value: #{bytes}" if bytes
      nil
    end

    def encode_value(value)
      nil
    end

    def default_tag
      Der::Tag::NULL
    end

  end
end
