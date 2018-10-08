class Account

  OPENING_BALANCE = 0

  attr_reader :balance

  def initialize
    @balance = OPENING_BALANCE
  end

end
