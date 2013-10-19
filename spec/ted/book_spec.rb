require 'spec_helper'

module Ted
  describe Book do
    subject { Book.new('filename') }

    it { should respond_to(:filename) }
    it { should respond_to(:build) }
    it { should respond_to(:sheets) }
    it { should respond_to(:save) }

    describe "#sheets" do
      specify { subject.sheets.should be_an_instance_of(Ted::Sheets) }
    end
  end
end
