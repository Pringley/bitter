# Bitter

Convert binary data to English gibberish using a dictionary of 2^16 words.

## Installation

Add this line to your application's Gemfile:

    gem 'bitter'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install bitter

## Usage

You can encode and decode strings of bytes using `Bitter.encode` and
`Bitter.decode`.

    require 'bitter'
    puts Bitter.encode File.new('pic.jpg').read

Bitter also works from the command line:

    $ echo "Hello world" | bitter
    electronically humblest impair

    $ bitter myphoto.jpg > myphoto.jpg.txt
    $ bitter --decode myphoto.jpg.txt > myphoto2.jpg
    $ diff myphoto.jpg myphoto2.jpg
