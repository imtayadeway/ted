require 'spec_helper'

module Ted
  describe Content do
    it { should respond_to(:document_content) }
    it { should respond_to(:attributes) }
    it { should respond_to(:xml) }

    describe "#xml" do
      specify { subject.xml.should be_a_kind_of(Builder) }
    end

    describe "#attributes" do
      specify { subject.attributes.should be_a_kind_of(Hash) }

      context "when asked for the office version" do
        it "returns 1.2" do
          subject.attributes['office:version'].should == '1.2'
        end
      end
    end

    describe "#document_content" do
      let(:content) { subject.document_content }
      specify { content.should be_a_kind_of(String) }

      it "specifies xml version 1.0" do
        content.should =~ /<?xml version="1.0"/
      end

      it "specifies UTF-8 encoding" do
        content.should =~ /encoding="UTF-8"\?>/
      end

      it "opens the office:document-content tag" do
        content.should =~ /<office:document-content/
      end

      describe "attributes" do
        it "specifies office version 1.2" do
          content.should =~ /office:version="1.2"/
        end
      end
    end
  end
end
