require_relative 'cached_encoding'

module Krypt::Asn1
  class Der::Length
    include Der::CachedEncoding

    INDEFINITE_LENGTH_MASK = 0x80

    attr_reader :length, :indefinite
    alias indefinite? indefinite

    def initialize(options)
      @length = options[:length]
      @indefinite = !!options[:indefinite]
      @encoding = options[:encoding]
    end

    private

    def encode
      Der::LengthEncoder.encode(self)
    end

  end
end

