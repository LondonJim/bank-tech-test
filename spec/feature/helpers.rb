module Helpers

  def new_account_with_deposit
    @new_account = Account.new
    @new_account.deposit(500)
  end

  def new_account_deposit_withdraw
    new_account_with_deposit
    @new_account.withdraw(250)
  end

end
