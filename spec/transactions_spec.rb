require 'transactions'

describe ".Transactions" do

  before(:each) do
    statement = double("Statement")
    @transactions = Transactions.new(statement)
    @check_date = Time.new(2019, 01, 01, 12, 0, 0, "+00:00")
    allow(Time).to receive(:new).and_return(@check_date)
    allow(statement).to receive(:printer) { |records| records }
  end

  it "can be created" do
    expect(@transactions).to be_instance_of(Transactions)
  end

  it "is instantiated with empty #records array" do
    expect(@transactions.instance_variable_get(:@records)).to eq([])
  end

  describe "#record" do

    it "can create an element containing transaction details" do
      @transactions.record(500, 500, "debit")
      expect(@transactions.instance_variable_get(:@records))
        .to eq([{amount: 500,
                 balance: 500,
                 date: @check_date,
                 type: "debit"}])
    end
  end

  describe "#display" do
    it "can send records to .Statement.printer" do
      @transactions.record(500, 500, "debit")
      expect(@transactions.display).to eq([{amount: 500,
                                            balance: 500,
                                            date: @check_date,
                                            type: "debit"}])
    end
  end

end
