require 'account'

describe "Account" do

  before(:each) do
    @new_account = Account.new
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
  end

  describe "#withdraw" do

    before(:each) do
      @new_account.deposit(500)
    end

    it "can be subtracted from #balance" do
      @new_account.withdraw(250)
      expect(@new_account.balance).to eq(250)
    end

    it "stop a withdrawal if ammount is more than balance" do
      @new_account.withdraw(1000)
      expect(@new_account.balance).to eq(500)
    end
  end
end
