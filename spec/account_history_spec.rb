require 'account_history'

describe "AccountHistory" do 
  let(:accounthistory) {AccountHistory.new}

  describe "#add_transaction" do
    it "can create a transaction and store it" do
      accounthistory.add_transaction(14/01/2020, 100, 100)
      expect(accounthistory.show_transactions).to eq([{time: 14/01/2020, credit: 100, debit: 0, balance: 100}])
    end
  end
end