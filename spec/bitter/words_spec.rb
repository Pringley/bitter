require 'spec_helper'
require 'bitter/words'

describe "word list" do
  subject { Bitter::WORDS }
  it { should have(2**11).items }
  it { should_not contain_duplicates }
end
