class Account

  OPENING_BALANCE = 0

  attr_reader :balance

  def initialize
    @balance = OPENING_BALANCE
  end

  def deposit(amount)
    @balance += ammount
  end

  def withdraw(amount)
    @balance -= amount if @balance >= amount
  end
end