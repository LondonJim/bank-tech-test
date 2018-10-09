class Transactions

  attr_accessor :records

  def initialize
    @records = []
  end

  def record(amount, balance, type)
    @records.push({amount: amount,
                   balance: balance,
                   date: create_date,
                   type: type})
    @records[-1]
  end

  private

  def create_date
    Time.new.strftime("%d/%m/%Y")
  end
end
