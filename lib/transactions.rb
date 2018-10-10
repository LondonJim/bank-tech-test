require_relative './statement'

class Transactions

  def initialize(statement = Statement)
    @statement = statement
    @records = []
  end

  def record(amount, balance, type)
    @records.push({ amount: amount,
                    balance: balance,
                    date: Time.new,
                    type: type })
    @records[-1]
  end

  def display
    @statement.printer(@records)
  end

end
