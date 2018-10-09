class Statement

  def initialize
    @statement = ""
  end

  def header
    "date || credit || debit || balance\n"
  end

  def printer(records)
    @statement << header
    records.each do |record|
      @statement += "#{record[:date]} "
      if record[:type] == "credit"
        @statement += "|| #{two_decimals(record[:amount])} ||"
      else
        @statement += "|| || #{two_decimals(record[:amount])}"
      end
      @statement += " || #{two_decimals(record[:balance])}\n"
    end
    puts @statement
    reset_statement
  end

  private

  def two_decimals(input)
    '%.2f' % input
  end

  def reset_statement
    @statement = ""
  end

end
