require '../lib/bank_account'

describe "BankAccount" do
  let(:bankaccount) { BankAccount.new}

  describe "#deposit" do
    it "increases bankaccount balance by 1000 when passed 1000 as an argument" do
      bankaccount.deposit(1000)
      expect(bankaccount.show_balance).to eq(1000);
    end
  end
end
