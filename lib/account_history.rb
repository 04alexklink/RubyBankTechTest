class AccountHistory

  def initialize
    @transactions = []
  end

  def add_transaction(time, amount, balance)
    if amount>=0 
      transaction = {time: time, credit: amount, debit: 0, balance: balance}
    else amount < 0
      transaction = {time: time, credit: 0, debit: -amount, balance: balance}
    end
    @transactions.push(transaction)
  end

  def show_transactions
    return @transactions
  end
end