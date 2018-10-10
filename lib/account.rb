require_relative 'transactions'

class Account

  OPENING_BALANCE = 0

  attr_reader :balance

  def initialize(transactions = Transactions.new)
    @transactions = transactions
    @balance = OPENING_BALANCE
  end

  def deposit(amount)
    invalid_check(amount)
    @balance += amount
    create_record(:credit, amount)
  end

  def withdraw(amount)
    invalid_check(amount)
    raise "Insufficient Funds" if @balance <= amount
    @balance -= amount
    create_record(:debit, -amount)
  end

  def display_statement
    @transactions.display
  end

  private

  def create_record(type, amount)
    @transactions.record(amount, @balance, type)
  end

  def invalid_check(amount)
    raise "Invalid Amount Entered" if
      (amount.class != Integer && amount.class != Float) || amount.zero?
  end

end
