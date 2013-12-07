require 'spec_helper'

module Ted
  describe Manifest do
    it { should respond_to(:xml) }
    it { should respond_to(:content) }

    describe "#xml" do
      specify { subject.xml.should be_a_kind_of(Builder::XmlMarkup) }
    end

    describe "#content" do
      let(:content) { subject.content }

      specify { content.should be_a_kind_of(String) }

      describe "attributes" do
        it "specifies manifest version 1.2" do
          content.should =~ /manifest:version="1.2"/
        end
      end

      specify { content.should =~ /<manifest:manifest/ }
      specify { content.should =~ /xmlns:manifest=\"urn:oasis:names:tc:opendocument:xmlns:manifest:1.0\"/ }
      specify { content.should =~ /<manifest:file-entry manifest:full-path=/ }
    end
  end
end
