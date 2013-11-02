require 'spec_helper'

module Ted
  describe Sheets do
    it { should respond_to(:build) }
    it { should respond_to(:each) }
    it { should respond_to(:sheetnames) }

    describe "#build" do
      context "with no arguments" do
        it "returns an instance of Sheet" do
          subject.build.should be_an_instance_of(Ted::Sheet)
        end

        specify "the sheet returned has a name generated for it" do
          subject.build.name.should =~ /Sheet 1/
        end
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
