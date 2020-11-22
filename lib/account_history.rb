class AccountHistory

  def initialize
    @transactions = []
  end

  def add_transaction(time, amount, balance)
    transaction = {time: time, credit: amount, debit: 0, balance: balance}
    @transactions.push(transaction)
  end

  def show_transactions
    return @transactions
  end
end