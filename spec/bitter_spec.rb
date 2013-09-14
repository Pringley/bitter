require "spec_helper"

describe Bitter do

  describe ".encode" do
    context "two null bytes" do
      subject { [0, 0].pack('c*') }
      it { should bitter_encode_to('aachen') }
    end
    context "three null bytes" do
      subject { Bitter.encode [0, 0, 0].pack('c*') }
      it { should eq('aachen aachen eight') }
    end
  end

  describe ".decode" do
    context "three null bytes" do
      subject { Bitter.decode "aachen aachen eight" }
      it { should eq([0, 0, 0].pack('c*')) }
    end
    context "hello world" do
      let(:string) { "hello world!" }
      subject { Bitter.decode(Bitter.encode string) }
      it { should eq(string) }
    end
  end

end
