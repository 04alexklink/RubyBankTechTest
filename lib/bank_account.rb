class BankAccount
  def initialize
    @transactions = ["date || credit || debit || balance"]
  end
  def deposit(amount, date)
    @transactions.push("#{date} || #{amount}.00 || || #{amount}.00  " )
  end

  def print_statement
    @transactions.join("\n")
  end

end