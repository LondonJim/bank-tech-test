require 'statement'

describe ".DisplayStatement" do

  before(:each) do
    @statement = Statement.new
    @records = [{amount: 500, balance: 500, date: "01/01/2019", type: "debit"},
                {amount: 250, balance: 750, date: "02/01/2019", type: "credit"},
                {amount: 300, balance: 450, date: "03/01/2019", type: "debit"}]
  end

  it "can be created" do
    expect(@statement).to be_instance_of(Statement)
  end

  describe "#printer" do
    it "can display a formatted statement based on records" do
      expect{@statement.printer(@records)}
        .to output("date || credit || debit || balance\n" +
                   "01/01/2019 || || 500.00 || 500.00\n" +
                   "02/01/2019 || 250.00 || || 750.00\n" +
                   "03/01/2019 || || 300.00 || 450.00\n").to_stdout
    end
  end


end
