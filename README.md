# RubyBankTechTest

Requirements
You should be able to interact with your code via a REPL like IRB or the JavaScript console. 
Deposits, withdrawal.
Account statement (date, amount, balance) printing.
Data can be kept in memory.

Acceptance criteria
Given a client makes a deposit of 1000 on 10-01-2012
And a deposit of 2000 on 13-01-2012
And a withdrawal of 500 on 14-01-2012
When she prints her bank statement
Then she would see

```
date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00
```

User Stories: 
As a bank customer,
So that I can use my account,
I'd like my bank account to record my balance.

As a bank customer,
So that I can use my account,
I'd like to be able to make a deposit

As a bank customer,
So that I can use my account,
I'd like to be able to make a withdrawal

As a bank customer,
So that each transaction is recorded,
I'd like to be able to store my transactions

As a bank customer,
So that I can see my transaction history,
I'd like to print my account statement

ASSUMPTIONS:
-- No overdraft: Can only make a withdrawal if my account balance is greater than requested withdrawal amount

EDGE CASES: 
-- Amount inputted to withdraw and deposit method cannot be strings or negative numbers
-- Amount requested for withdrawal cannot be greater than current balance


DIAGRAMS/EXPLANATION OF CLASSES:

INSTALLATION INSTRUCTIONS:

TESTING INSTRUCTIONS:

SCREENSHOT OF INTERACTION IN IRB: