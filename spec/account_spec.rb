require 'account'

describe "Account" do

  before(:each) do
    @new_account = Account.new
  end

  it "can be created" do
    expect(@new_account).to be_instance_of(Account)
  end

  it "is instantiated with a balance of 0" do
    expect(@new_account.balance).to eq(0)
  end
end
