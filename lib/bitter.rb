require "bitter/version"

module Bitter

  # Encode a String of bytes using the bitter word list.
  def self.encode byte_string
    footer = nil
    words = byte_string.each_byte.each_slice(2).collect do |pair|
      first = pair.first
      second = if pair.size == 2
                 pair[0]
               else
                 footer = 'eight'
                 0
               end
      WORDS[first * (2**8) + second]
    end
    words << footer if not footer.nil?
    words.join ' '
  end

end
