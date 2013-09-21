require "securerandom"
require "bitter/version"
require "bitter/words"

module Bitter

  NUMBERS = Hash[%w{one two three four five six seven eight nine ten
     eleven twelve thirteen fourteen fifteen}.zip(1..15)]

  # Encode a String of bytes using the bitter word list.
  def self.encode byte_string
    footer = nil
    words = byte_string.each_byte.each_slice(2).collect do |pair|
      first = pair.first
      second = if pair.size == 2
                 pair[1]
               else
                 footer = 'eight'
                 0
               end
      WORDS[first * (2**8) + second]
    end
    words << footer if not footer.nil?
    words.join ' '
  end

  # Decode a String of bytes using the bitter word list.
  def self.decode bitter_string
    words = bitter_string.split
    number = words.pop if NUMBERS.has_key? words.last
    bytes = words.collect { |word|
      twobyte = WORDS.index(word)
      second = twobyte % (2**8)
      first = twobyte / 2**8
      [first, second]
    }.flatten
    if number
      if number == 'eight'
        bytes.pop
      else
        raise RuntimeError 'Cannot decode bit-by-bit'
      end
    end
    bytes.pack('c*')
  end

  # Generate the specified number of random bytes and encode them.
  def self.random bytes
    encode SecureRandom.random_bytes(bytes)
  end

end
