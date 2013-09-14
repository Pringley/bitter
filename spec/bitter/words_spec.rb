require 'spec_helper'
require 'bitter/words'

describe "word list" do
  subject { Bitter::WORDS }
  it { should have(2**16).items }
  it { should_not contain_duplicates }
  %w{one two three four five six seven eight nine ten
     eleven twelve thirteen fourteen fifteen}.each do |word|
    it { should_not include(word) }
  end
end
