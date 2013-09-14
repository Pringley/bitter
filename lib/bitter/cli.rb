require 'bitter'

module Bitter::CLI
  def self.main
    decode = ARGV.include?('-d') || ARGV.include?('--decode')
    ARGV.delete '-d'
    ARGV.delete '--decode'
    if decode 
      puts Bitter.decode ARGF.read
    else
      puts Bitter.encode ARGF.read
    end
  end
end
