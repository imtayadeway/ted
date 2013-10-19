module Ted
  describe Sheet do
    subject { Sheet.new('Sheet 1', a: {id: :data_1, name: 'a header'}) }
    it { should respond_to(:name) }
    its(:name) { should_not be_nil }
    it { should respond_to(:columns) }
    it { should respond_to(:headers) }
    it { should respond_to(:options) }
    it { should respond_to(:rows) }
    it { should respond_to(:insert) }
    it { should respond_to(:next_row) }
    it { should respond_to(:blank_row) }
    it { should respond_to(:populated_row) }
    it { should respond_to(:next_row_data) }

    describe "#columns" do
      specify { subject.columns.should be_a_kind_of(Array) }

      it "starts with :a" do
        subject.columns.first.should == :a
      end

      it "ends with :amj" do
        subject.columns.last.should == :amj
      end

      it "contains 1024 elements" do
        subject.columns.should have(1024).items
      end
    end

    describe "#headers" do
      context "when initialized with column 'A' header" do
        it "returns the name for column 'A'" do
          subject.headers[:a][:name].should match(/a header/)
        end

        it "returns the id for column 'A'" do
          subject.headers[:a][:id].should == :data_1
        end
      end
    end

    describe "#rows" do
      specify { subject.rows.should_not be_nil }
      specify { subject.rows.should be_a_kind_of(Array) }
    end

    describe "#insert" do
      it "adds a row to the list of rows" do
        expect {
          subject.insert(data_1: '$123')
        }.to change { subject.rows.count }.by(1)
      end
    end

    describe "#next_row" do
      it "returns the first empty row" do
        subject.next_row.should == 2
      end
    end

    describe "#blank_row" do
      specify { subject.blank_row.should be_a_kind_of(Hash) }

      it "returns a hash of empty empty strings with header ids for keys" do
        subject.blank_row.should == {data_1: ''}
      end
    end

    describe "#populated_row" do
      it "returns a blank row with empty hash" do
        subject.populated_row({}).should == {data_1: ''}
      end

      it "returns a blank row populated with the data passed to it" do
        subject.populated_row(data_1: '$123').should == {data_1: '$123'}
      end
    end

    describe "#next_row_data" do
      it "returns a hash with row number for key and data for values" do
        subject.next_row_data(data_1: '$123').should == {2 => {data_1: '$123'}}
      end
    end
  end
end
