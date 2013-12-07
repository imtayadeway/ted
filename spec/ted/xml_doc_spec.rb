require 'spec_helper'

module Ted
  describe XmlDoc do
    it { should respond_to(:xml) }
    it { should respond_to(:content) }

    describe "#content" do
      it "raises a NotImplementedError" do
        expect {
          subject.content
        }.to raise_error(NotImplementedError, /You must implement #content/)
      end
    end
  end
end
