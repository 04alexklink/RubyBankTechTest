class BankAccount

  def initialize(statement = Statement.new)
    @transactions = []
    @balance = 0
    @statement = statement
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
    @statement.print_statement(@transactions)
  end

  private 

  def add_transaction(date, type, amount) 
    transaction = Transaction.new(date, type, amount, @balance)
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