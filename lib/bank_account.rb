class BankAccount
  def initialize(statement = Statement.new, transaction_class = Transaction)
    @transactions = []
    @balance = 0
    @statement = statement
    @transaction_class = transaction_class
  end

  def deposit(amount, date)
    p amount.is_a? Numeric
    p "Hello"
    raise "Invalid entry for deposit amount" if not_a_positive_number?(amount)
    @balance += amount
    type = "deposit"
    add_transaction(date, type, amount)
  end

  def withdraw(amount, date)
    raise "Invalid entry for withdrawal amount" if not_a_positive_number?(amount)
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
    transaction = @transaction_class.new(date, type, amount, @balance)
    @transactions.push(transaction)
  end

  def insufficient_funds?(amount)
    amount > @balance
  end

  def not_a_positive_number?(amount)
    !((amount.is_a? Numeric) && (amount.positive?))
  end

end