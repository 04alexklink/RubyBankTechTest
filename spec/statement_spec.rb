require '../lib/statement'

describe "Statement" do
  let(:statement) { Statement.new }
  let(:transaction1) { Transaction.new("25/11/2020", "deposit", 100, 100) }

  describe "print_statement" do
    it "takes an array of transaction objects as an argument and prints them in a structured format" do
      expect(statement.print_statement([transaction1])).to eq("date || credit || debit || balance\n25/11/2020 || 100.00 || || 100.00 ")
    end
  end
end