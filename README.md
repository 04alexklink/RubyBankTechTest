# RubyBankTechTest

## App Info:
The aim was to build a bank application that can be used in a REPL. You can make both deposits and withdrawals, and by printing the bank statement you can see a list of your transaction history alongside corresponding dates and a running balance. 

**Acceptance Criteria For The Project:**
```
Given a client makes a deposit of 1000 on 10-01-2012
And a deposit of 2000 on 13-01-2012
And a withdrawal of 500 on 14-01-2012
When the client prints their bank statement
Then the client would see
```

```
date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00
```

**User Stories That I Created:**
``` 
As a bank customer,
So that I can save my money,
I'd like to be able to make a deposit

As a bank customer,
So that I can access my money,
I'd like to be able to make a withdrawal

As a bank customer,
So that I can monitor my spending and saving,
I'd like to be able to print my account statement
```

**Assumptions That I Made:**
- No overdraft: Can only make a withdrawal if my account balance is greater than requested withdrawal amount.
- When opening a bank account: There isn't the option to transfer bank balance from another account, so starting balance is always 0.

**Edge Cases:**
- Amount inputted to withdraw and deposit cannot be strings or negative numbers(User input is of the correct type)
- Amount requested for withdrawal cannot be greater than current balance

**Explanation of My Approach:**

This application was built in Ruby, and uses Rspec for testing. 
I have used 3 classes to try and keep high cohesion. The dependencies between classes are injected to help with the aim of keeping code loosely coupled:
- BankAccount class: accessible to the user and is used to make deposits, withdrawals, and print statement. It stores both the balance and transactions. It depends on the Statement and Transaction class but these are injected upon initialisation of a new bankaccount instance. 
- Statement class: Called in the print_statement of the BankAccount Class. This class deals with formatting the transactions (passed as an argument), and returns the format expected. This class deals with formatting of Time and amounts, so that if a different format was requested, the bank account class could have a different formatter injected into it.  
- Transaction class: Every time a transaction is made, a new transaction object is created. This class helps with encapsulation of data. 

In each class I have used private methods to help with SRP and encapsulation. 
User stories I came up with were to reflect end-user requirements expected from the acceptance criteria. 

**Testing:**

I have mocked the dependencies in my unit tests so each class is tested in isolation. A feature test spec ensures all classes actually interacting is tested for. I have also tried to test behaviour rather than state as best as possible, and testing end user interaction (expected input/output) in my feature test and bankaccount unit tests. Code coverage is 100%.

**Testing Instructions:**

Requires rspec, simplecov and rubocop gems to be installed. 

**Example Interaction in IRB:**
```
bankaccount = BankAccount.new
bankaccount.deposit(1000)
bankaccount.withdraw(500)
bankaccount.print_statement

date || credit || debit || balance
02/02/2021 || || 500.00 || 500.00
02/02/2021 || 1000.00 || || 1000.00
```
