require 'spec_helper'

module Ted
  describe Content do
    it { should respond_to(:document_content_attrs) }
    it { should respond_to(:markup) }
    it { should respond_to(:generate) }
    it { should respond_to(:book) }
    it { should respond_to(:font_face_attrs) }
    it { should respond_to(:style_attrs) }
    it { should respond_to(:style_table_attrs) }
    it { should respond_to(:table_attrs) }
    it { should respond_to(:style_table_tags) }

    describe "#markup" do
      specify { subject.markup.should be_a_kind_of(Builder::XmlMarkup) }
    end

    describe "#font_face_attrs" do
      let(:attrs) { subject.font_face_attrs }
      specify { attrs.should be_a_kind_of(Array) }

      it "returns an array of hashes" do
        attrs.each { |a| a.should be_a_kind_of(Hash) }
      end
    end

    describe "#style" do
    end

    describe "#style_attrs" do
      let(:attrs) { subject.style_attrs }
      specify { attrs.should be_a_kind_of(Array) }

      it "returns an array of hashes" do
        attrs.each { |a| a.should be_a_kind_of(Hash) }
      end
    end

    describe "#generate" do
      let(:content) { subject.generate }

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

    describe "#document_content_attrs" do
      specify { subject.document_content_attrs.should be_a_kind_of(Hash) }

      context "when asked for the office version" do
        it "returns 1.2" do
          subject.document_content_attrs['office:version'].should == '1.2'
        end
      end
    end
  end
end
