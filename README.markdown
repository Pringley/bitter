# Bitter

[![Build Status](https://travis-ci.org/Pringley/bitter.png)](https://travis-ci.org/Pringley/bitter)

Convert binary data to English gibberish using a dictionary of 2^16 words.

A normal 128-bit number can be encoded in hexidecimal as:

    aaf4c61ddcc5e8a2dabede0f3b482cd9aea9434d

This is pretty tough to copy by hand. Why not use English? Bitter takes the
same 128-bit number and encodes it as:

    ponce scarlet successive toughened streamlines
    superlative deng compressor pried dominions

The word list is available in
[`words.txt`](https://github.com/Pringley/bitter/raw/master/words.txt).

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
