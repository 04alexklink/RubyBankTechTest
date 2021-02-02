class Statement
  def initialize
    @statement_header = "date || credit || debit || balance\n"
  end

  def print_statement(transactions_array)
    statement_body = transactions_formatter(transactions_array).join("\n")
    @statement_header + statement_body
  end

  private 

  def transactions_formatter(transactions)
    transactions.reverse.map do |transaction|
      if transaction.type == "deposit"
        "#{format_date(transaction.date)} || #{format_to_2dp(transaction.amount)} || || #{format_to_2dp(transaction.balance)}"
      elsif transaction.type == "withdrawal"
        "#{format_date(transaction.date)} || || #{format_to_2dp(transaction.amount)} || #{format_to_2dp(transaction.balance)}"
      end
    end
  end

  def format_to_2dp(number)
    format("%0.2f", number)
  end

  def format_date(date)
    date.strftime("%d/%m/%Y")
  end
end
