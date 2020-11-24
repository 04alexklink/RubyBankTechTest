class BankAccount

  def initialize
    @transactions = []
    @balance = 0
  end

  def deposit(amount, date)
    raise "Invalid entry for deposit amount" if (invalid_string_input?(amount)) || (negative_amount_inputted?(amount))
    @balance += amount
    type = "deposit"
    add_transaction(date, type, amount)
  end

  def withdraw(amount, date)
    raise "Invalid entry for withdrawal amount" if (invalid_string_input?(amount)) || (negative_amount_inputted?(amount))
    raise "Insufficient funds" if insufficient_funds?(amount)
    @balance -= amount
    type = "withdrawal"
    add_transaction(date, type, amount)
  end

  def print_statement
    header = "date || credit || debit || balance"
    transaction_format = @transactions.map do |transaction|
      if transaction[:type] == "deposit"
        "#{transaction[:date]} || #{transaction[:amount]}.00 || || #{transaction[:balance]}.00 "
      else transaction[:type] == "withdrawal"
        "#{transaction[:date]} || || #{transaction[:amount]}.00 || #{transaction[:balance]}.00 "
      end
    end
    transaction_format.reverse.unshift(header).join("\n")
  end

  private 

  def add_transaction(date, type, amount) 
    transaction = {date: date, type: type, amount: amount, balance: @balance}
    @transactions.push(transaction)
  end

  def insufficient_funds?(amount)
    amount > @balance
  end

  def negative_amount_inputted?(amount)
    amount.negative?
  end

  def invalid_string_input?(amount)
    amount.class == String
  end

end