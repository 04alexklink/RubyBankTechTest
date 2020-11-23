require '../lib/bank_account'

describe "BankAccount" do
  let(:bankaccount) { BankAccount.new }

  describe "#deposit" do
    it "knows that 1000 has been deposited " do
      bankaccount.deposit(1000, "23/11/2020")
      expect(bankaccount.print_statement).to eq("date || credit || debit || balance\n23/11/2020 || 1000.00 || || 1000.00 ")
    end
    it "knows that 500 has been deposited " do
        bankaccount.deposit(500, "23/11/2020")
        expect(bankaccount.print_statement).to eq("date || credit || debit || balance\n23/11/2020 || 500.00 || || 500.00 ")
    end
  end
  describe "#withdraw" do
    it "knows that 500 has been withdrawn" do
      bankaccount.deposit(1000, "23/11/2020")
      bankaccount.withdraw(500, "23/11/2020")
      expect(bankaccount.print_statement).to eq("date || credit || debit || balance\n23/11/2020 || || 500.00 || 500.00 \n23/11/2020 || 1000.00 || || 1000.00 ")
    end
  end
end
