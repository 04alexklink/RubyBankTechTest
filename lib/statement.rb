class Statement

  def print_statement(transactions_array)
    statement_header = "date || credit || debit || balance"
    statement_body = transactions_formatter(transactions_array)
    statement_body.reverse.unshift(statement_header).join("\n")
  end

  private 

  def transactions_formatter(transactions)
    transactions.map do |transaction|
      if transaction.content[:type] == "deposit"
        "#{transaction.content[:date]} || #{format_to_2dp(transaction.content[:amount])} || || #{format_to_2dp(transaction.content[:balance])} "
      else transaction.content[:type] == "withdrawal"
        "#{transaction.content[:date]} || || #{format_to_2dp(transaction.content[:amount])} || #{format_to_2dp(transaction.content[:balance])} "
      end
    end
  end

  def format_to_2dp(number)
    sprintf("%0.2f", number)
  end

end
