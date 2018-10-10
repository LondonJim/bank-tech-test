module Statement

  def self.printer(records)
    statement = "date || credit || debit || balance\n"
    records.each do |record|
      statement += "#{convert_date(record[:date])} " +
        transaction_check(record) + " || #{two_decimals(record[:balance])}\n"
    end
    puts statement
  end

  private_class_method

  def self.convert_date(date)
    date.strftime("%d/%m/%Y")
  end

  def self.transaction_check(record)
    if record[:amount].positive?
      "|| #{two_decimals(record[:amount])} ||"
    else
      "|| || #{two_decimals(record[:amount].abs)}"
    end
  end

  def self.two_decimals(input)
    '%.2f' % input
  end

end
