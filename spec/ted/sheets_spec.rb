require 'spec_helper'

module Ted
  describe Sheets do
    it { should respond_to(:build) }
    it { should respond_to(:each) }
    it { should respond_to(:sheetnames) }
    it { should respond_to(:new_sheetname) }

    describe "#build" do
      it "returns an instance of Sheet" do
        subject.build.should be_an_instance_of(Ted::Sheet)
      end
    end

    describe "#each" do
      before { subject.build }
      let(:bucket) { [] }

      it "yields each sheet to the block" do
        subject.each { |sheet| bucket << sheet }
        bucket.first.should be_an_instance_of(Ted::Sheet)
      end
    end
  end
end
