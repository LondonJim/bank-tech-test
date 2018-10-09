require_relative 'transactions'

class Account

  OPENING_BALANCE = 0

  attr_reader :balance

  def initialize(transactions = Transactions.new)
    @transactions = transactions
    @balance = OPENING_BALANCE
  end

  def deposit(amount)
    @balance += amount
    create_record("credit", amount)
  end

  def withdraw(amount)
    if @balance >= amount
      @balance -= amount
      create_record("debit", -amount)
    end
  end

  private

  def create_record(type, amount)
    @transactions.record(amount, @balance, type)
  end

end
