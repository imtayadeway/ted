require 'spec_helper'

module Ted
  describe XmlDoc do
    it { should respond_to(:xml) }
    it { should respond_to(:generate) }

    describe "#generate" do
      it "raises a NotImplementedError" do
        expect {
          subject.generate
        }.to raise_error(NotImplementedError, /You must implement #generate/)
      end
    end
  end
end
