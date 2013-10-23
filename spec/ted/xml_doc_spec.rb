require 'spec_helper'

module Ted
  describe XmlDoc do
    subject { XmlDoc::ATTRIBUTES }
    it { should be_a_kind_of(Hash) }

    context "when asked for the office version" do
      it "returns 1.2" do
        subject['office:version'].should == '1.2'
      end
    end
  end
end
