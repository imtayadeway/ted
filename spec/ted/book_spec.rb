require 'spec_helper'

module Ted
  describe Book do
    subject { Book.build('filename') }

    it { should respond_to(:filename) }
    it { should respond_to(:sheets) }
    it { should respond_to(:add_sheet) }
    it { should respond_to(:save) }

    describe ".build" do
      specify { Book.should respond_to(:build) }
      specify { Book.build(name: 'filename').should be_an_instance_of(Book) }
    end

    describe "#add_sheet" do
      it "adds a sheet" do
        expect { subject.add_sheet }.to change { subject.sheets.count }.by(1)
      end

      it "returns a sheet" do
        subject.add_sheet.should be_an_instance_of(Ted::Sheet)
      end
    end

    describe "#sheets" do
      specify { subject.sheets.should be_an_instance_of(Ted::Sheets) }
    end

    describe "#save" do
      after { File.exist?('filename.ods') && File.delete('filename.ods') }

      it "creates a new file" do
        expect {
          subject.save
        }.to change{ File.exist?('filename.ods') }.to(true)
      end
    end
  end
end
