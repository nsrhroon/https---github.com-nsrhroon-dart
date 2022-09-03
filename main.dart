
// Create an inheritance hierarchy that a bank might use to represent customers' bank accounts. 
// All customers each having an account no. at this bank can deposit (i.e., credit) money into their accounts 
//and withdraw (i.e., debit) money from their accounts. More specific types of accounts also exist. CreditCardAccount, 
//for instance, provide the user the facility to make money transactions using ATM the money they hold. Checking accounts,
// on the other hand, charge a fee per transaction (i.e., credit or debit). Create an inheritance hierarchy 
//containing base class Account and derived classes CreditCardAccount and CheckingAccount that inherit from class Account. 
//Base class Account should include one data member of type double to represent the account balance. Customer’s 
//name and account no.

// The account no. should be unique and assigned in the order in which instances are created 
//The class should provide a constructor that receives an initial balance and uses it to initialize the data member.
//The constructor should validate the initial balance to ensure that it is greater than or equal to 0.0.
// If not, the balance should be set to 0.0 and the constructor should display an error message, 
//indicating that the initial balance was invalid. The class should provide following member functions.

// Member function credit should add an amount to the current balance.
// Member function debit should withdraw money from the Account and ensure that the debit amount does not exceed
// the Account's balance. If it does, the balance should be left unchanged and the 
// function should print the message "Debit amount exceeded account balance.
// Member function getBalance should return the current balance.
// Member function getAccountNo.
// Derived class CreditCardAccount should inherit the functionality of an Account, but also include a data member pinnumber set by the customer.

// Constructor should receive the initial balance, as well as pin number.
// It should provide a public member function resetpin
// Derived class CheckingAccount should inherit from base class Account and include an additional data member 
//of type double that represents the fee charged per transaction to all the customers.

// CheckingAccount's constructor should receive the initial balance, as well as a parameter indicating a fee amount.
// Class CheckingAccount should redefine member functions credit and debit so that they subtract the fee from the account 
//balance whenever either transaction is performed successfully. CheckingAccount's versions of these functions should
// invoke the base-class Account version to perform the updates to an account balance. CheckingAccount's debit function 
//should charge a fee only if money is actually withdrawn (i.e., the debit amount does not exceed the account balance).
// After defining the classes in this hierarchy, write a program that creates objects of each class and tests their member 
// functions.

void main() {
Account yummsAcc = Account(initialBalance: 100);
yummsAcc.customerName = "Yumss";
Account nasarAcc = Account(initialBalance: 110);
nasarAcc.customerName = "Noopu";


print(yummsAcc.getAccountNo());
print(nasarAcc.getAccountNo());
print(yummsAcc.getBalance());
yummsAcc.debit(20);
print(yummsAcc.getBalance());
yummsAcc.credit(100);
print(yummsAcc.getBalance());

}


// Base / Parent class
class Account {
  String? customerName;
  double balance = 0.0;
  int accountNumber = 0;
  // should be unique
  static int _accountCounter = 0;


  Account({required double initialBalance}) {
    if (initialBalance < 0){
      print("Invalid data");
    }
    else {
      this.balance = initialBalance;
    }
    accountNumber = _accountCounter;
    _accountCounter++;
  }

  void credit(double amount) {
    balance += amount;
  }

  void debit(double deb) {
    if (deb < balance) {
      balance = balance - deb;
    } else {
      print("Debit amount exceeded account balance");
    }
  }

  double getBalance() {
    return balance;
  }

  int getAccountNo() {
    return accountNumber;
  }

}

// Derived / Child class
class CreditCardAccount extends Account {
  int pinNumber = 0;

  CreditCardAccount({required int pin, required double initBal}) : super(initialBalance: initBal) {
    this.pinNumber = pin;
  }

  void resetpin(int newPin) {
    pinNumber = newPin;
  }

}

class CheckingAccount extends Account {
  double feeCharged = 3;

  CheckingAccount({required double inBalance, required double fee}) : super(initialBalance: inBalance) {
    feeCharged = fee;
  }
  
  @override
  void credit(double amount) {
    if (balance + amount < feeCharged) {
      print("Fee is greated than balance");
    }
    else {
      super.credit(amount);
      balance = balance - feeCharged;
    }

  }

  @override
  void debit(double deb) {
    if (deb + feeCharged < balance) {
      super.debit(deb);
    } else {
      print("Debit amount exceeded account balance");
    }
  }
}
