require 'spec_helper'

module Ted
  describe Meta do
    it { should respond_to(:markup) }
    it { should respond_to(:generate) }

    describe "#markup" do
      specify { subject.markup.should be_a_kind_of(Builder::XmlMarkup) }
    end

    describe "#generate" do
      let(:content) { subject.generate }

      specify { content.should be_a_kind_of(String) }

      describe "attributes" do
        it "specifies office version 1.2" do
          content.should =~ /office:version="1.2"/
        end
      end

      specify { content.should =~ /<office:meta>/ }
      specify { content.should =~ /<meta:initial-creator>/ }
      specify { content.should =~ /<meta:creation-date>/ }
      specify { content.should =~ /<meta:document-statistic/ }
      specify { content.should =~ /<meta:generator>/ }
    end
  end
end
