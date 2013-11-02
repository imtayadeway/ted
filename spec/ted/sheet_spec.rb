module Ted
  describe Sheet do
    subject { Sheet.new('Sheet 1', a: {id: :data_1, name: 'a header'}) }
    it { should respond_to(:name) }
    it { should respond_to(:columns) }
    it { should respond_to(:headers) }
    it { should respond_to(:options) }
    it { should respond_to(:rows) }
    it { should respond_to(:insert) }

    its(:name) { should_not be_nil }

    describe "#name=" do
      it "assigns the sheet a new name" do
        expect {
          subject.name = 'Sheet 2'
        }.to change { subject.name }.to('Sheet 2')
      end
    end

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
          subject.headers[:a][:name].should =~ /a header/
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
      let(:insert_row) { subject.insert(data_1: '$123') }

      it "adds a row to the list of rows" do
        expect { insert_row }.to change { subject.rows.count }.by(1)
      end
    end

    describe "private methods" do
      describe "#blank_row" do
        specify { subject.send(:blank_row).should be_a_kind_of(Hash) }

        it "returns a hash of empty empty strings with header ids for keys" do
          subject.send(:blank_row).should == {data_1: ''}
        end
      end

      describe "#populated_row" do
        it "returns a blank row with empty hash" do
          subject.send(:populated_row, {}).should == {data_1: ''}
        end

        it "returns a blank row populated with the data passed to it" do
          subject.send(:populated_row, data_1: '$123').should == {data_1: '$123'}
        end
      end

      describe "#next_row_data" do
        it "returns a hash with row number for key and data for values" do
          subject.send(:next_row_data, data_1: '$123').should == {2 => {data_1: '$123'}}
        end
      end
    end
  end
end
