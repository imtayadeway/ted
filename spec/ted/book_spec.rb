require 'spec_helper'

module Ted
  describe Book do
    subject { Book.build('filename') }

    it { should respond_to(:filename) }
    it { should respond_to(:sheets) }
    it { should respond_to(:build) }
    it { should respond_to(:save) }

    describe ".build" do
      specify { Book.should respond_to(:build) }
      specify { Book.build(name: 'filename').should be_an_instance_of(Book) }
    end

    describe "#build" do
      it "adds a sheet" do
        expect { subject.build }.to change { subject.sheets.count }.by(1)
      end

      it "returns a sheet" do
        subject.build.should be_an_instance_of(Ted::Sheet)
      end
    end

    describe "#sheets" do
      specify { subject.sheets.should be_an_instance_of(Ted::Sheets) }
    end


  end
end
