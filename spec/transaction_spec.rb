require 'transaction'

describe 'Transaction' do
  let(:time) { Time.now }
  it 'takes date, type, amount and balance parameters and stores them as properties' do
    transaction = Transaction.new(time, 'Withdrawal', 50, 100)
    expect(transaction.date).to eq(time)
    expect(transaction.type).to eq('Withdrawal')
    expect(transaction.amount).to eq(50)
    expect(transaction.balance).to eq(100)
  end
end
