module Ted
  describe Sheet do
    subject {
      Sheet.new(
        'Sheet 1',
        a: {id: :data_1, name: 'header1'},
        b: {id: :data_2, name: 'header2'}
      )
    }

    it { should respond_to(:name) }
    it { should respond_to(:columns) }
    it { should respond_to(:headers) }
    it { should respond_to(:options) }
    it { should respond_to(:rows) }
    it { should respond_to(:insert) }
    it { should respond_to(:row) }
    it { should respond_to(:column) }

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

    describe "#column" do
      before do
        3.times { |n| subject.insert({data_1: 2 * (n + 1) - 1, data_2: 2 * n}) }
      end

      it "returns the values for that column" do
        subject.column(:a).should == [1,3,5]
      end
    end

    describe "#row" do
      before do
        subject.rows << 'Row 2'
      end

      it "returns the row corresponding to the spreadsheet row number" do
        subject.row(2).should == 'Row 2'
      end

      specify "the first row comprises the headers" do
        subject.row(1).should == {data_1: 'header1', data_2: 'header2'}
      end
    end

    describe "#headers" do
      context "when initialized with column 'A' header" do
        it "returns the name for column 'A'" do
          subject.headers[:a][:name].should =~ /header1/
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
  end
end
