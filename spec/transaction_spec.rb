require '../lib/transaction'

describe "Transaction" do
  it "takes date, type, amount and balance parameters and stores them as properties" do
    transaction = Transaction.new("24/11/2020", "Withdrawal", 50, 100)
    expect(transaction.content[:date]).to eq("24/11/2020")
    expect(transaction.content[:type]).to eq("Withdrawal")
    expect(transaction.content[:amount]).to eq(50)
    expect(transaction.content[:balance]).to eq(100)
  end
end