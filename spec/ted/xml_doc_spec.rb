require 'spec_helper'

module Ted
  describe XmlDoc do
    include XmlDoc

    describe "#document_content_attrs" do
      specify { document_content_attrs.should be_a_kind_of(Hash) }

      context "when asked for the office version" do
        it "returns 1.2" do
          document_content_attrs['office:version'].should == '1.2'
        end
      end
    end
  end
end
