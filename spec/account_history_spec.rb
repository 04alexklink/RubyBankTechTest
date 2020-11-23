require 'account_history'

describe "AccountHistory" do 
  let(:accounthistory) {AccountHistory.new}

  describe "#add_transaction" do
    it "can create a transaction with 2nd parameter, if +ve, being received as credit, and storing it" do
      accounthistory.add_transaction(14/01/2020, 100, 100)
      expect(accounthistory.show_transactions).to eq([{time: 14/01/2020, credit: 100, debit: 0, balance: 100}])
    end
    
    it "can create a transaction with 2nd parameter, if -ve, being received as debit, and storing it" do
      accounthistory.add_transaction(14/01/2020, 100, 100)
      accounthistory.add_transaction(15/01/2020, -50, 50)
      expect(accounthistory.show_transactions[1]).to eq({time: 15/01/2020, credit: 0, debit: 50, balance: 50})
    end
  end
end