# RubyBankTechTest

## App Info:
The aim was to build a bank application that you can interact with in a REPL like IRB or the JavaScript console. It was not a requirement to implement a command line interface that takes input from STDIN. You can make both deposits and withdrawals, and by printing the bank statement you can see a list of your transaction history alongside corresponding dates and a running balance. Data could be kept in memory and was not required to be stored in a database or file. 

**Acceptance Criteria For The Project:**
- Given a client makes a deposit of 1000 on 10-01-2012
- And a deposit of 2000 on 13-01-2012
- And a withdrawal of 500 on 14-01-2012
- When the client prints their bank statement
- Then the client would see

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

Edge case:
----------
As a bank customer, 
So that I do not have an overdraft,
I would like my account to warn me if withdrawal would exceed my balance
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
- BankAccount class: accessible to the user and is used to make deposits, withdrawals, and print the statement. It stores both the balance and transactions. It depends on the Statement and Transaction class but these are injected upon initialisation of a new bankaccount instance to aid loose coupling.
- Statement class: Called in the print_statement of the BankAccount Class which delegates to print_statement method of the statement class. This class deals with formatting the transactions (including Time and Amount), and returns the format expected. By separating this out it aids high cohesion and separates the concerns of display from logic.  
- Transaction class: Every time a transaction is made, a new transaction object is created. This class helps with encapsulation of data. 

In each class I have used private methods to help with SRP encapsulation and to keep code DRY. 
User stories I came up with were to reflect end-user requirements expected from the acceptance criteria. 

**Testing:**

I have mocked the dependencies in my unit tests so each class is tested in isolation. A feature test spec ensures all classes actually interacting is tested for. I have also tried to test behaviour rather than state as best as possible, and testing end user interaction (expected input/output) in my feature test and bankaccount unit tests. Code coverage is 100%.

**Instructions**

### Set-up
1. git clone https://github.com/04alexklink/RubyBankTechTest.git
2. Run 'bundle install' in CL to install gems
3. Run 'rspec' to check tests pass. Also shows simplecov code coverage as 100%
4. Run 'rubocop' : checks for readability and use of best syntax


**Example Interaction in IRB:**
```
$ irb
irb(main):001:0> require './lib/bank_account.rb'
=> true
=> #<BankAccount:0x0000000006d29f00 @transactions=[], @balance=0, @statement=#<Statement:0x0000000006d29ed8 @s...  
irb(main):003:0> b.deposit(1000)
=> [#<Transaction:0x0000000006bc37d8 @date=2021-02-02 21:39:15.3660576 +0000, @type="deposit", @amount=1000, @balance=1000>]
irb(main):004:0> b.withdraw(50)
=> [#<Transaction:0x0000000006bc37d8 @date=2021-02-02 21:39:15.3660576 +0000, @type="deposit", @amount=1000, @balance=1000>, #<Transaction:0x000000000676e840 @date=2021-02-02 21:39:21.718323 +0000, @type="withdrawal", @amount=50, 
@balance=950>]
irb(main):005:0> b.print_statement
date || credit || debit || balance
02/02/2021 || || 50.00 || 950.00
02/02/2021 || 1000.00 || || 1000.00=> nil
```
