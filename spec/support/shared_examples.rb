shared_examples "an xml doc" do
  it { should respond_to(:xml) }
  it { should respond_to(:content) }
  it { should respond_to(:name) }
  it { should respond_to(:file) }
  it { should respond_to(:write) }
  it { should respond_to(:close) }
  it { should respond_to(:full_name) }
  it { should respond_to(:path) }

  its(:file) { should be_a_kind_of(Tempfile) }

  describe "#write" do
    after(:each) { subject.file.close }
    
    it "writes the content to file" do
      expect { subject.write }.to change { subject.file.read }
    end
  end
  
  describe "#content" do
    it "is implemented" do
      expect { subject.content }.not_to raise_error
    end
  end
  
  describe "#name" do
    it "is implemented" do
      expect { subject.name }.not_to raise_error
    end
  end
  
  describe "#xml" do
    specify { subject.xml.should be_a_kind_of(Builder::XmlMarkup) }
  end

  describe "#content" do
    its(:content) { should be_a_kind_of(String) }
    
    it "specifies xml version 1.0" do
      subject.content.should =~ /<?xml version="1.0"/
    end

    it "specifies UTF-8 encoding" do
      subject.content.should =~ /encoding="UTF-8"\?>/
    end
    
    describe "attributes" do
      it "specifies office version 1.2" do
        subject.content.should =~ /office:version="1.2"/
      end
    end
  end
end
