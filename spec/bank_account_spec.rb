require 'bank_account'

describe "BankAccount" do
  let(:statement_double) { double :statement }
  let(:bankaccount) { BankAccount.new(statement_double, transaction_class_double) }
  let(:transaction_double) { double :transaction}
  let(:transaction_class_double) { double :transaction_class, new: transaction_double }
  describe "#deposit" do
    it "knows that 1000 has been deposited " do
      expect(transaction_class_double).to receive(:new).with("23/11/2020", "deposit", 1000, 1000)
      bankaccount.deposit(1000, "23/11/2020")
      allow(statement_double).to receive(:print_statement).with([transaction_double]).and_return("date || credit || debit || balance\n23/11/2020 || 1000.00 || || 1000.00 ")
      expect(bankaccount.print_statement).to eq("date || credit || debit || balance\n23/11/2020 || 1000.00 || || 1000.00 ")
    end
    it "knows that 500 has been deposited " do
      expect(transaction_class_double).to receive(:new).with("23/11/2020", "deposit", 500, 500)
      bankaccount.deposit(500, "23/11/2020")
      allow(statement_double).to receive(:print_statement).with([transaction_double]).and_return("date || credit || debit || balance\n23/11/2020 || 500.00 || || 500.00 ")
      expect(bankaccount.print_statement).to eq("date || credit || debit || balance\n23/11/2020 || 500.00 || || 500.00 ")
    end
    it "only accepts positive numbers as amounts" do
      expect { bankaccount.deposit("500", "23/11/2020") }.to raise_error("Invalid entry for deposit amount")
      expect { bankaccount.deposit(-500, "23/11/2020") }.to raise_error("Invalid entry for deposit amount")
      expect { bankaccount.deposit([1,"2",3], "23/11/2020") }.to raise_error("Invalid entry for deposit amount")
    end
  end
  describe "#withdraw" do
    it "knows that 500 has been withdrawn" do
      expect(transaction_class_double).to receive(:new).with("23/11/2020", "deposit", 1000, 1000)
      bankaccount.deposit(1000, "23/11/2020")
      expect(transaction_class_double).to receive(:new).with("23/11/2020", "withdrawal", 500, 500)
      bankaccount.withdraw(500, "23/11/2020")
      allow(statement_double).to receive(:print_statement).with([transaction_double, transaction_double]).and_return("date || credit || debit || balance\n23/11/2020 || || 500.00 || 500.00 \n23/11/2020 || 1000.00 || || 1000.00 ")
      expect(bankaccount.print_statement).to eq("date || credit || debit || balance\n23/11/2020 || || 500.00 || 500.00 \n23/11/2020 || 1000.00 || || 1000.00 ")
    end
    it "raises error message if withdrawal amount exceeds bankaccount balance" do
      expect { bankaccount.withdraw(500, "23/11/2020") }.to raise_error("Insufficient funds")
    end 
    it "only accepts positive numbers as amounts" do
      bankaccount.deposit(1000, "23/11/2020")
      expect { bankaccount.withdraw("500", "23/11/2020") }.to raise_error("Invalid entry for withdrawal amount")
      expect { bankaccount.withdraw(-500, "23/11/2020") }.to raise_error("Invalid entry for withdrawal amount")
      expect { bankaccount.withdraw([1,"2",3], "23/11/2020") }.to raise_error("Invalid entry for withdrawal amount")
    end
  end
end
