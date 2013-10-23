require 'spec_helper'

module Ted
  describe Content do
    it { should respond_to(:document_content) }
    it { should respond_to(:attributes) }
    it { should respond_to(:xml) }
    it { should respond_to(:generate) }
    it { should respond_to(:font_face) }
    it { should respond_to(:font_face_attributes) }

    describe "#xml" do
      specify { subject.xml.should be_a_kind_of(Builder::XmlMarkup) }
    end

    describe "#font_face" do
      let(:receiver) { double('receiver') }
      before { receiver.stub(:style) }

      it "sends the argument #style(:'font-face')" do
        pending('false negative')
        subject.font_face(receiver)
        receiver.should_receive(:style).with(:'font-face')
      end
    end

    describe "#font_face_attributes" do
      specify { subject.font_face_attributes.should be_a_kind_of(Array) }

      it "returns an array of hashes" do
        subject.font_face_attributes.each { |a| a.should be_a_kind_of(Hash) }
      end
    end

    describe "#generate" do
      let(:content) { subject.generate }
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
