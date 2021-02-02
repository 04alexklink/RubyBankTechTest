require_relative 'statement'
require_relative 'transaction'

class BankAccount
  DEPOSIT = "deposit".freeze
  WITHDRAWAL = "withdrawal".freeze

  def initialize(statement = Statement.new, transaction_class = Transaction)
    @transactions = []
    @balance = 0
    @statement = statement
    @transaction_class = transaction_class
  end

  def deposit(amount)
    raise "Invalid entry for deposit amount" if not_a_positive_number?(amount)

    @balance += amount
    add_transaction(DEPOSIT, amount)
  end

  def withdraw(amount)
    raise "Invalid entry for withdrawal amount" if not_a_positive_number?(amount)

    raise "Insufficient funds" if insufficient_funds?(amount)

    @balance -= amount
    add_transaction(WITHDRAWAL, amount)
  end

  def print_statement
    print @statement.print_statement(@transactions)
  end

  private 

  def add_transaction(type, amount) 
    transaction = @transaction_class.new(Time.now, type, amount, @balance)
    @transactions.push(transaction)
  end

  def insufficient_funds?(amount)
    amount > @balance
  end

  def not_a_positive_number?(amount)
    !((amount.is_a? Numeric) && amount.positive?)
  end
end