class Transaction
  def initialize(date, type, amount, balance)
    @content = {date: date, type: type, amount: amount, balance: balance}
  end

  def content 
    @content
  end
end
#     @time = date
#     @type = type
#     @amount = amount
#     @balance = balance
#   end

#   def time
#     @time
#   end

#   def type
#     @type
#   end

#   def amount
#     @amount
#   end

#   def balance
#     @balance
#   end

# end