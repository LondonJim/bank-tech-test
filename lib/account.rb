class Account

  OPENING_BALANCE = 0

  attr_reader :balance, :statement

  def initialize
    @balance = OPENING_BALANCE
    @statement = []
  end

  def deposit(amount)
    @balance += amount
    create_record("deposit", amount)
  end

  def withdraw(amount)
    if @balance >= amount
      @balance -= amount
      create_record("withdraw", -amount)
    end
  end

  # def statement
  #   return @statement
  # end

  def create_record(type, amount)
    @statement.push({amount: amount,
                     balance: @balance,
                     date: "01/01/2019",
                     type: type})

  end
end
