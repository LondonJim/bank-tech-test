# Bank Tech Test

### Requirements

* Be able to interact with your code via a REPL like IRB.
* Deposits, withdrawal.
* Account statement (date, amount, balance) printing.
* Data can be kept in memory (it doesn't need to be stored to a database).

### Acceptance criteria

**Given** a client makes a deposit of 1000 on 10-01-2012  
**And** a deposit of 2000 on 13-01-2012  
**And** a withdrawal of 500 on 14-01-2012  
**When** she prints her bank statement  
**Then** she would see
```
date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00
```

### Client Stories

```
As a client
So I can keep my money safe
I want to be able to open a new account
```
```
As a client
So I can store my money
I want to be able to deposit into my account
```
```
As a client
So I can have access to my money
I want to be able to withdraw my money
```
```
As a client
So I can keep track of my finances
I want to be able to see a statement of my transactions
```

### CRC Model

```
+-----------------------------------------------+
|                    Account                    |
+-----------------------------------------------+
| Responsibilities:            | Collaborators: |
+------------------------------+----------------+
| Deposits                     |                |
+------------------------------+----------------+
| Withdraws                    |                |
+------------------------------+----------------+
| Create record of transaction | Transactions   |
+------------------------------+----------------+
| Display statement            | Transactions   |
+------------------------------+----------------+

+---------------------------------------------+
|                 Transactions                |
+---------------------------------------------+
| Responsibilities:   | Collaborators:        |
+---------------------+-----------------------+
| Record transactions |                       |
+---------------------+-----------------------+
| Display statement   | Statements            |
+---------------------+-----------------------+

+---------------------------------------------+
|                  Statements                 |
+---------------------------------------------+
| Responsibilities:          | Collaborators: |
+----------------------------+----------------+
| Display statements         |                |
+----------------------------+----------------+
| Formatting of Transactions |                |
+----------------------------+----------------+
```

## How to run

Download

```
$ git clone git@github.com:LondonJim/Bank-Tech-Test.git
$ cd bank-tech-test
$ bundle
```

## How to use
Currently it can be run only through an REPL in this case irb

```
$ irb
```

Require the related file
```
2.5.1 :001 > require './lib/account'
```

Creating an account
```
2.5.1 :002 > new_account = Account.new
```

Depositing 'Money' eg. 500

```
2.5.1 :003 > new_account.deposit(500)
```

Withdrawing 'Money' eg. 250
```
2.5.1 :004 > new_account.withdraw(250)
```

Displaying Statement
```
2.5.1 :005 > new_account.display_statement
```

Example of displayed statement in irb
```
date || credit || debit || balance
09/10/2018 || 500.00 || || 500.00
09/10/2018 || || 250.00 || 250.00
```

## Testing

Both feature and unit testing is completed using `RSpec 3.8`
`simplecov` is installed and shows 100% coverage.

Run tests:
```
$ rspec
```

## Reflections
The tech test was completed using TDD with regular commits throughout the process.

Although hard in the beginning I managed to unit test in isolation using mocking and doubles. The problem came when I wanted to test the recorded date that is added to the transaction records. Within the unit tests I mocked the outcome to suit the test, but for the feature tests I wanted something different. A gem called `Timecop` worked very well at 'freezing' time so as to complete the feature test (also pushed the coverage up to 100%).

I moved some responsibilities to new classes as I went along, at one stage I had a bank class but decided against it as it meant creating accounts by a bank and it would mean moving away from the requirements of the test.
