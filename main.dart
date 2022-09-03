import 'dart:io';

void main() {
  Account acc = new Account(100);
  print(acc.balance);
  print(acc.credit());
  print(acc.debit());
  // CreditCardAccount acc1 = new CreditCardAccount();
  // print(acc1.PinNumber);
  CheckingAccount acc2 = new CheckingAccount(100, 10);
  print(acc2.bal);
}

class Account {
  //String Customername;
  double balance = 0;

  // String Accountno;

  Account(double balance) {
    this.balance = balance;
  }
  double credit() {
    print("Amount to be credited");
    double cre = double.parse(stdin.readLineSync()!);

    balance = balance + cre;
    return balance;
  }

  double debit() {
    print("Amount to be debited");

    double deb = double.parse(stdin.readLineSync()!);
    if (deb < balance) {
      balance = balance - deb;
      print("your balance is");
    } else {
      print("not enough balance");
    }
    return balance;
  }
}

//class CreditCardAccount extends Account {
//double PinNumber = 0;

// CreditCardAccount() {
// print("initial balance of your card");
//double Pin = double.parse(stdin.readLineSync()!);
//this.PinNumber = Pin;
//}
//}

class CheckingAccount extends Account {
  double Feecharged = 0;
  double bal = 0;

  CheckingAccount(double super.balance, double feecharged) {
    this.Feecharged = feecharged;
    super.balance = bal;
  }
  @override
  double credit() {
    bal = super.balance - Feecharged;
    return bal;
  }
}
