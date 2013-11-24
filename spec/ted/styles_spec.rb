require 'spec_helper'

module Ted
  describe Styles do
    it { should respond_to(:xml) }
    it { should respond_to(:generate) }

    describe "#xml" do
      specify { subject.xml.should be_a_kind_of(Builder::XmlMarkup) }
    end

    describe "#generate" do
      let(:content) { subject.generate }

      specify { content.should be_a_kind_of(String) }

      describe "attributes" do
        it "specifies office version 1.2" do
          content.should =~ /office:version="1.2"/
        end
      end

      specify { content.should =~ /<office:styles>/ }
      specify { content.should =~ /<office:automatic-styles>/ }
      specify { content.should =~ /<office:master-styles>/ }
    end
  end
end
