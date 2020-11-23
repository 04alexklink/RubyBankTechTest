require '../lib/bank_account'

describe "BankAccount" do
  let(:bankaccount) { BankAccount.new }

  describe "#deposit" do
    it "knows that 1000 has been deposited " do
      bankaccount.deposit(1000)
      expect(bankaccount.print_statement).to eq("date || credit || debit || balance /n 23/11/2020 || 1000.00 || || 1000.00 ")
    end
  end
end
