class Statement

  def printer(records)
    @statement = String.new
    @statement << header
    records.each do |record|
      @statement += "#{convert_date(record[:date])} "
      transaction_check(record)
      @statement += " || #{two_decimals(record[:balance])}\n"
    end
    puts @statement
  end

  private

  def header
    "date || credit || debit || balance\n"
  end

  def convert_date(date)
    date.strftime("%d/%m/%Y")
  end

  def transaction_check(record)
    if record[:amount].positive?
      @statement += "|| #{two_decimals(record[:amount])} ||"
    else
      @statement += "|| || #{two_decimals(record[:amount].abs)}"
    end
  end

  def two_decimals(input)
    '%.2f' % input
  end

end
