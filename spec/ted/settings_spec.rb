require 'spec_helper'

module Ted
  describe Settings do
    it { should respond_to(:xml) }
    it { should respond_to(:content) }

    describe "#xml" do
      specify { subject.xml.should be_a_kind_of(Builder::XmlMarkup) }
    end

    describe "#content" do
      let(:content) { subject.content }

      specify { content.should be_a_kind_of(String) }

      describe "attributes" do
        it "specifies office version 1.2" do
          content.should =~ /office:version="1.2"/
        end
      end

      specify { content.should =~ /<office:document-settings/ }
      specify { content.should =~ /xmlns:office="urn:oasis:names:tc:opendocument:xmlns:office:1.0"/ }
      specify { content.should =~ /xmlns:xlink="http:\/\/www.w3.org\/1999\/xlink"/ }
      specify { content.should =~ /xmlns:config="urn:oasis:names:tc:opendocument:xmlns:config:1.0"/ }
      specify { content.should =~ /xmlns:ooo="http:\/\/openoffice.org\/2004\/office"/ }
      specify { content.should =~ /<office:settings>/ }
      specify { content.should =~ /<config:config-item-set config:name="ooo:view-settings">/ }
      specify { content.should =~ /<config:config-item config:name="VisibleAreaTop" config:type="int">/ }

    end
  end
end
