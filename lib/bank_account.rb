class BankAccount

  def initialize
    @transactions = []
    @balance = 0
  end

  def deposit(amount, date)
    raise "Invalid entry for deposit amount" if (invalid_string_input?(amount)) || (negative_amount_inputted?(amount))
    @balance += amount
    @transactions.push("#{date} || #{amount}.00 || || #{@balance}.00 ")
  end

  def withdraw(amount, date)
    raise "Invalid entry for withdrawal amount" if (invalid_string_input?(amount)) || (negative_amount_inputted?(amount))
    raise "Insufficient funds" if insufficient_funds?(amount)
    @balance -= amount
    @transactions.push("#{date} || || #{amount}.00 || #{@balance}.00 ")
  end

  def print_statement
    header = "date || credit || debit || balance"
    @transactions.reverse.unshift(header).join("\n")
  end

  private 

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