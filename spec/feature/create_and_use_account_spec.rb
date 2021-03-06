require 'account'
require 'statement'
require 'transactions'
require 'Timecop'

describe "Account" do

  before(:each) do
    @new_account = Account.new
  end

  example "is created by client" do
    expect(@new_account).to be_instance_of(Account)
  end

  example "is deposited into" do
    @new_account.deposit(500)

    expect(@new_account.balance).to eq(500)
  end

  example "is deposited into then withdrawn from" do
    @new_account.deposit(500)
    @new_account.withdraw(250)

    expect(@new_account.balance).to eq(250)
  end

  example "attempt to withdrawn more than balance" do
    @new_account.deposit(500)

    expect{@new_account.withdraw(1000)}.to raise_error("Insufficient Funds")
  end

  example "attempt to enter amount that is 0 when withdrawing" do
    expect{@new_account.withdraw(0)}.to raise_error("Invalid Amount Entered")
  end

  example "attempt to enter amount that is is string when withdrawing" do
    expect{@new_account.withdraw("Not a valid entry")}
      .to raise_error("Invalid Amount Entered")
  end

  example "attempt to withdrawn more than balance" do
    @new_account.deposit(500)

    expect{@new_account.withdraw(1000)}.to raise_error("Insufficient Funds")
  end

  example "statement is requested" do
    new_time = Time.new(2019, 01, 01, 12, 0, 0, "+00:00")
    Timecop.freeze(new_time)
    @new_account.deposit(500)
    @new_account.withdraw(250)

    expect{@new_account.display_statement}
      .to output("date || credit || debit || balance\n" +
                 "01/01/2019 || 500.00 || || 500.00\n" +
                 "01/01/2019 || || 250.00 || 250.00\n").to_stdout

    Timecop.return
  end

end
