require 'spec_helper'

module Ted
  describe Meta do
    it { should respond_to(:xml) }
    it { should respond_to(:content) }
    it { should respond_to(:write) }
    it { should respond_to(:file) }

    its(:file) { should be_a_kind_of(Tempfile) }

    describe "#write" do
      it "writes the content to file" do
        expect {
          subject.write
        }.to change { subject.file.read }
      end
    end

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

      specify { content.should =~ /<office:meta>/ }
      specify { content.should =~ /<meta:initial-creator>#{ ENV['USER'] }/ }
      specify { content.should =~ /<meta:creation-date>#{ DateTime.now.to_s }/ }
      specify { content.should =~ /<meta:document-statistic meta:table-count=/ }
      specify { content.should =~ /<meta:generator>Ted/ }
    end
  end
end
