require '../lib/statement'

describe "Statement" do
  let(:statement) { Statement.new }
  let(:transaction1) { Transaction.new("25/11/2020", "deposit", 100, 100) }
  let(:transaction2) { Transaction.new("25/11/2020", "withdrawal", 50, 50) }

  describe "print_statement" do
    it "takes an array of transaction objects as an argument and prints them in a structured format with header first" do
      expect(statement.print_statement([transaction1])).to eq("date || credit || debit || balance\n25/11/2020 || 100.00 || || 100.00 ")
    end
    it "prints transactions in order of most recent first and each transaction displayed on new line" do
        expect(statement.print_statement([transaction1, transaction2])).to eq("date || credit || debit || balance\n25/11/2020 || || 50.00 || 50.00 \n25/11/2020 || 100.00 || || 100.00 ")
      end
  end
end