require 'spec_helper'

module Ted
  describe Book do
    subject { Book.build('filename', '/tmp') }

    it { should respond_to(:filename) }
    it { should respond_to(:sheets) }
    it { should respond_to(:add_sheet) }
    it { should respond_to(:save) }
    it { should respond_to(:add_sheet) }
    it { should respond_to(:sheetnames) }
    it { should respond_to(:content) }
    it { should respond_to(:manifest) }
    it { should respond_to(:meta) }
    it { should respond_to(:settings) }
    it { should respond_to(:styles) }
    it { should respond_to(:xml_docs) }
    
    its(:content) { should be_an_instance_of(Ted::Content) }
    its(:manifest) { should be_an_instance_of(Ted::Manifest) }
    its(:meta) { should be_an_instance_of(Ted::Meta) }
    its(:settings) { should be_an_instance_of(Ted::Settings) }
    its(:styles) { should be_an_instance_of(Ted::Styles) }

    describe ".build" do
      specify { Book.should respond_to(:build) }
      specify { Book.build('filename', '/tmp').should be_an_instance_of(Book) }
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
      specify { subject.sheets.should be_an_instance_of(Array) }
    end
    
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

    describe "#save" do
      after { File.exist?('/tmp/filename.ods') && File.delete('/tmp/filename.ods') }

      it "creates a new file" do
        expect {
          subject.save
        }.to change{ File.exist?('/tmp/filename.ods') }.to(true)
      end
    end
  end
end
