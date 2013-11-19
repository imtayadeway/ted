require 'spec_helper'

module Ted
  describe XmlDoc do
    it { should respond_to(:markup) }
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
