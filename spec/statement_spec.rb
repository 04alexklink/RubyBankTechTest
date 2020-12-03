require 'statement'

describe 'Statement' do
  let(:statement) { Statement.new }
  let(:time1) { Time.now }
  let(:time2) { Time.now + 24*60*60 }
  let(:transaction1) { double :transaction, date: time1, type: 'deposit', amount: 100, balance: 100 }
  let(:transaction2) { double :transaction, date: time2, type: 'withdrawal', amount: 50, balance: 50 }

  describe 'print_statement' do
    it 'takes an array of transaction objects as an argument and prints them in a structured format with header first' do
      expect(statement.print_statement([transaction1])).to eq("date || credit || debit || balance\n#{time1.strftime("%d/%m/%Y")} || 100.00 || || 100.00 ")
    end
    it 'formats deposits and withdrawals in correct columns and prints transactions in order of most recent first' do
      expect(statement.print_statement([transaction1, transaction2])).to eq("date || credit || debit || balance\n#{time2.strftime("%d/%m/%Y")} || || 50.00 || 50.00 \n#{time1.strftime("%d/%m/%Y")} || 100.00 || || 100.00 ")
    end
  end
end
