require 'bank_account'
require 'statement'
require 'transaction'

describe "BankAccount" do
  let(:time1) { Time.now }
  let(:time2) { Time.now + 24*60*60 }
  it "accepts withdrawals and deposits and prints out formatted statement" do 
    bankaccount = BankAccount.new
    allow(Time).to receive(:now).and_return(time1)
    bankaccount.deposit(1000)
    allow(Time).to receive(:now).and_return(time2)
    bankaccount.withdraw(500)
    expect(bankaccount.print_statement).to eq("date || credit || debit || balance\n#{time2.strftime("%d/%m/%Y")} || || 500.00 || 500.00\n#{time1.strftime("%d/%m/%Y")} || 1000.00 || || 1000.00")
  end
end
