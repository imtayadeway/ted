require 'spec_helper'

module Xml
  describe Content do
    it_behaves_like "an xml doc"

    it { should respond_to(:book) }
    it { should respond_to(:rows) }

    describe "#rows" do
      specify { subject.rows.should be_a_kind_of(Array) }
    end

    describe "#content" do
      let(:content) { subject.content }

      it "opens the office:document-content tag" do
        content.should =~ /<office:document-content/
      end

      describe "attributes" do
        it "specifies office version 1.2" do
          content.should =~ /office:version="1.2"/
        end
      end

      specify { content.should =~ /office:version="1.2">/ }
      specify { content.should =~ /office:document-content/ }
      specify { content.should =~ /office:scripts/ }
      specify { content.should =~ /office:font-face-decls/ }
      specify { content.should =~ /office:automatic-styles/ }
      specify { content.should =~ /office:body/ }
      specify { content.should =~ /style:font-face/ }
      specify { content.should =~ /style:name="Arial"/ }
      specify { content.should =~ /style:name="DejaVu Sans"/ }
      specify { content.should =~ /style:name="Lohit Hindi"/ }
      specify { content.should =~ /style:name="WenQuanYi Zen Hei"/ }
      specify { content.should =~ /style:name="co1"/ }
      specify { content.should =~ /style:name="ro1"/ }
      specify { content.should =~ /style:name="ta1"/ }
      specify { content.should =~ /style:table-row-properties/ }
      specify { content.should =~ /style:table-column-properties/ }
      specify { content.should =~ /style:table-properties/ }
      specify { content.should =~ /office:spreadsheet/ }
      specify { content.should =~ /table:name/ }
      specify { content.should =~ /table:style-name="ta1"/ }
      specify { content.should =~ /table:number-columns-repeated/ }
      specify { content.should =~ /table:default-cell-style-name/ }
    end
  end
end
