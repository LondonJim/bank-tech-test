class Account

  OPENING_BALANCE = 0

  attr_reader :balance

  def initialize
    @balance = OPENING_BALANCE
  end

  def deposit(ammount)
    @balance += ammount
  end

  def withdraw(ammount)
    @balance -= ammount if @balance >= ammount
  end
end
