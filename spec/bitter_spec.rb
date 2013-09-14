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

end
