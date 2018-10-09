require 'statement'

describe ".DisplayStatement" do

  before(:each) do
    @statement = Statement.new
    check_date = Time.new(2019, 01, 01, 12, 0, 0, "+00:00")
    @records = [{amount: 500, balance: 500, date: check_date, type: :debit},
                {amount: 250, balance: 750, date: check_date, type: :credit},
                {amount: 300, balance: 450, date: check_date, type: :debit}]
  end

  it "can be created" do
    expect(@statement).to be_instance_of(Statement)
  end

  describe "#printer" do
    it "can display a formatted statement based on records" do
      expect{@statement.printer(@records)}
        .to output("date || credit || debit || balance\n" +
                   "01/01/2019 || || 500.00 || 500.00\n" +
                   "01/01/2019 || 250.00 || || 750.00\n" +
                   "01/01/2019 || || 300.00 || 450.00\n").to_stdout
    end
  end

end
