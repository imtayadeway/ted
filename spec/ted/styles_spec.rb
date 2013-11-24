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
      specify { content.should =~ /<style:font-face style:name="Arial"/ }
      specify { content.should =~ /svg:font-family="Arial"/ }
      specify { content.should =~ /<style:font-face style:name="DejaVu Sans"/ }
      #specify { content.should =~ /svg:font-family="&apos;DejaVu Sans&apos;"/ }
      specify { content.should =~ /<style:font-face style:name="Lohit Hindi"/ }
      #specify { content.should =~ /svg:font-family="&apos;Lohit Hindi&apos;"/ }
      specify { content.should =~ /<style:font-face style:name="WenQuanYi Zen Hei"/ }
      #specify { content.should =~ /svg:font-family="&apos;WenQuanYi Zen Hei&apos;"/ }
      specify { content.should =~ /<style:default-style style:family="table-cell">/ }
      specify { content.should =~ /<style:paragraph-properties style:tab-stop-distance="0.5in"\/>/ }
      specify { content.should =~ /<style:text-properties style:font-name="Arial" / }
      specify { content.should =~ /fo:language="en" fo:country="US"/ }
      specify { content.should =~ /style:font-name-asian="DejaVu Sans"/ }
      specify { content.should =~ /style:language-asian="zh" style:country-asian="CN"/ }
      specify { content.should =~ /style:font-name-complex="DejaVu Sans"/ }
      specify { content.should =~ /style:language-complex="hi" style:country-complex="IN"\/>/ }
      specify { content.should =~ /<number:number-style style:name="N0">/ }

    end
  end
end
