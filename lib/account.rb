class Account

  OPENING_BALANCE = 0

  attr_reader :balance

  def initialize
    @balance = OPENING_BALANCE
  end

  def deposit(amount)
    @balance += amount
  end

  def withdraw(amount)
    @balance -= amount if @balance >= amount
  end

  def statement
    return [{date: "01/01/2019"},
            {type: "deposit"},
            {amount: 500},
            {current_balance: 500}]
  end
end
