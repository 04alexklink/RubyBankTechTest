class BankAccount

  def initialize
    @balance = 0
  end

  def deposit(amount)
    @balance += amount
  end

  def withdraw(amount)
    raise "Balance is insufficient. Current balance: #{@balance}" if insufficient_funds?(amount)
    @balance -= amount
  end

  def show_balance
    @balance
  end

  private

  def insufficient_funds?(amount)
    @balance < amount
  end 

end