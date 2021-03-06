require 'account'

describe ".Account" do

  before(:each) do
    transactions = double("Transactions")
    @new_account = Account.new(transactions)

    allow(transactions).to receive(:display)
      .and_return("statement display")

    allow(transactions).to receive(:record) do |amount, balance, type|
      {amount: amount, balance: balance, date: "01/01/2019", type: type}
    end
  end

  it "can be created" do
    expect(@new_account).to be_instance_of(Account)
  end

  describe "#balance" do
    it "is instantiated with a balance of 0" do
      expect(@new_account.balance).to eq(0)
    end
  end

  describe "#deposit" do
    it "can be added to #balance" do
      @new_account.deposit(500)
      expect(@new_account.balance).to eq(500)
    end

    it "records the date of the deposit" do
      expect(@new_account.deposit(500)).to eq({amount: 500,
                                               balance: 500,
                                               date: "01/01/2019",
                                               type: :credit})
    end

    it "raises error if amount deposited is 0" do
      expect{@new_account.deposit(0)}.to raise_error("Invalid Amount Entered")
    end

    it "raises error if amount deposited is not a float or integer" do
      expect{@new_account.deposit("not a float or integer!")}
        .to raise_error("Invalid Amount Entered")
    end

  end

  describe "#withdraw" do

    before(:each) do
      @new_account.deposit(500)
    end

    it "can be subtracted from #balance" do
      @new_account.withdraw(250)
      expect(@new_account.balance).to eq(250)
    end

    it "stop a withdrawal if amount is more than balance" do
      expect{@new_account.withdraw(1000)}.to raise_error("Insufficient Funds")
    end

    it "records the date of the withdraw" do
      expect(@new_account.withdraw(250)).to eq({amount: -250,
                                                balance: 250,
                                                date: "01/01/2019",
                                                type: :debit})
    end

    it "raises error if amount withdrawn is 0" do
      expect{@new_account.withdraw(0)}.to raise_error("Invalid Amount Entered")
    end

    it "raises error if amount withdrawn is not a float or integer" do
      expect{@new_account.withdraw("not a float or integer!")}
        .to raise_error("Invalid Amount Entered")
    end
  end

  describe "#display_statement" do
    it "returns 'statement display'" do
      expect(@new_account.display_statement)
        .to eq('statement display')
    end
  end

end
