require 'account'

describe "Account" do

  before(:each) do
    @new_account = Account.new
  end

  it "can be created" do
    expect(@new_account).to be_instance_of(Account)
  end

end
