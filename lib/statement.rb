class Statement

  def initialize
    @statement_header = "date || credit || debit || balance"
  end

  def print_statement(transactions_array)
    statement_body = transactions_formatter(transactions_array)
    statement_body.unshift(@statement_header).join("\n")
  end

  private 

  def transactions_formatter(transactions)
    transactions.reverse.map do |transaction|
      if transaction.type == "deposit"
        "#{transaction.date} || #{format_to_2dp(transaction.amount)} || || #{format_to_2dp(transaction.balance)} "
      else transaction.type == "withdrawal"
        "#{transaction.date} || || #{format_to_2dp(transaction.amount)} || #{format_to_2dp(transaction.balance)} "
      end
    end
  end

  def format_to_2dp(number)
    sprintf("%0.2f", number)
  end

end
