class BankAccount

  def initialize
    @transactions = []
    @balance = 0
  end

  def deposit(amount, date)
    @balance += amount
    @transactions.push("#{date} || #{amount}.00 || || #{@balance}.00 ")
  end

  def withdraw(amount, date)
    raise "Insufficient funds" if amount > @balance
    @balance -= amount
    @transactions.push("#{date} || || #{amount}.00 || #{@balance}.00 ")
  end

  def print_statement
    header = "date || credit || debit || balance"
    @transactions.reverse.unshift(header).join("\n")
  end

end