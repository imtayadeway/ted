require 'spec_helper'

module Ted
  describe Sheets do
    it { should respond_to(:add_sheet) }
    it { should respond_to(:each) }
    it { should respond_to(:sheetnames) }

    describe "#add_sheet" do
      context "with no arguments" do
        it "returns an instance of Sheet" do
          subject.add_sheet.should be_an_instance_of(Ted::Sheet)
        end

        specify "the sheet returned has a name generated for it" do
          subject.add_sheet.name.should =~ /Sheet 1/
        end
      end
    end

    describe "#each" do
      before { subject.add_sheet }

      it "yields each sheet to the block" do
        subject.each do |sheet|
          sheet.should be_an_instance_of(Ted::Sheet)
        end
      end
    end
  end
end
