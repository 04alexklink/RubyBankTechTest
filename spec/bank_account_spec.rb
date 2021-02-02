require 'bank_account'

describe 'BankAccount' do
  let(:statement_double) { double :statement }
  let(:bankaccount) { BankAccount.new(statement_double, transaction_class_double) }
  let(:transaction_double) { double :transaction }
  let(:transaction_class_double) { double :transaction_class, new: transaction_double }
  let(:time1) { Time.now }
  let(:time2) { Time.now + 24*60*60 }
  describe '#deposit' do
    it 'knows that 1000 has been deposited ' do
      allow(Time).to receive(:now).and_return(time1)
      expect(transaction_class_double).to receive(:new).with(time1, 'deposit', 1000, 1000)
      bankaccount.deposit(1000)
      allow(statement_double).to receive(:print_statement).with([transaction_double]).and_return("date || credit || debit || balance\n#{time1.strftime("%d/%m/%Y")} || 1000.00 || || 1000.00")
      expect { bankaccount.print_statement }.to output("date || credit || debit || balance\n#{time1.strftime("%d/%m/%Y")} || 1000.00 || || 1000.00").to_stdout
    end
    it 'only accepts positive numbers as amounts' do
      expect { bankaccount.deposit('500') }.to raise_error('Invalid entry for deposit amount')
      expect { bankaccount.deposit(-500) }.to raise_error('Invalid entry for deposit amount')
      expect { bankaccount.deposit([1,'2',3]) }.to raise_error('Invalid entry for deposit amount')
    end
  end
  describe '#withdraw' do
    it 'knows that 500 has been withdrawn' do
      allow(Time).to receive(:now).and_return(time1)
      expect(transaction_class_double).to receive(:new).with(time1, 'deposit', 1000, 1000)
      bankaccount.deposit(1000)
      allow(Time).to receive(:now).and_return(time2)
      expect(transaction_class_double).to receive(:new).with(time2, 'withdrawal', 500, 500)
      bankaccount.withdraw(500)
      allow(statement_double).to receive(:print_statement).with([transaction_double, transaction_double]).and_return("date || credit || debit || balance\n#{time2.strftime("%d/%m/%Y")} || || 500.00 || 500.00\n#{time1.strftime("%d/%m/%Y")} || 1000.00 || || 1000.00")
      expect { bankaccount.print_statement }.to output("date || credit || debit || balance\n#{time2.strftime("%d/%m/%Y")} || || 500.00 || 500.00\n#{time1.strftime("%d/%m/%Y")} || 1000.00 || || 1000.00").to_stdout
    end
    it 'raises error message if withdrawal amount exceeds bankaccount balance' do
      expect { bankaccount.withdraw(500) }.to raise_error('Insufficient funds')
    end 
    it 'only accepts positive numbers as amounts' do
      bankaccount.deposit(1000)
      expect { bankaccount.withdraw('500') }.to raise_error('Invalid entry for withdrawal amount')
      expect { bankaccount.withdraw(-500) }.to raise_error('Invalid entry for withdrawal amount')
      expect { bankaccount.withdraw([1,'2',3]) }.to raise_error('Invalid entry for withdrawal amount')
    end
  end
end
