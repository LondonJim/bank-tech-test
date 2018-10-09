require 'transactions'

describe ".Transactions" do

  before(:each) do
    @transactions = Transactions.new
    allow(@transactions).to receive(:create_date).and_return("01/01/2019")
  end

  it "can be created" do
    expect(@transactions).to be_instance_of(Transactions)
  end

  it "is instantiated with empty #records array" do
    expect(@transactions.records).to eq([])
  end

  describe "#record" do

    it "can create an element containing transaction details" do
      @transactions.record(500, 500, "debit")
      expect(@transactions.records).to eq([{amount: 500,
                                           balance: 500,
                                           date: "01/01/2019",
                                           type: "debit"}])
    end
  end

end
