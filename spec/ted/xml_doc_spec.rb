require 'spec_helper'

module Ted
  describe XmlDoc do
    it { should respond_to(:content_attributes) }

    describe "#content_attributes" do
      it "returns a hash" do
        subject.content_attributes.should be_a_kind_of(Hash)
      end

      it "returns an office version of 1.2" do
        subject.content_attributes['office:version'].should == '1.2'
      end
    end
  end
end
