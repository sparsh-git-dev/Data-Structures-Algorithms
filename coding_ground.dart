import 'dart:math';

import 'graphs/medium/LTC_399_evaluate_division/code.dart';

void main() {
  final a = [-15, -13, 4, 7];
  // maxIncreasingSubarrays(a);
}

class Bank {
  List<int> _balance = [];

  Bank(List<int> balance) {
    this._balance = balance;
  }

  bool transfer(int account1, int account2, int money) {
    account1--;
    account2--;
    if (_balance[account1] < money) return false;
    _balance[account1] = _balance[account1] - money;
    _balance[account2] = _balance[account2] + money;
    return true;
  }

  bool deposit(int account, int money) {
    _balance[account - 1] = _balance[account - 1] + money;
    return true;
  }

  bool withdraw(int account, int money) {
    if (_balance[account - 1] < money) return false;
    _balance[account - 1] = _balance[account - 1] - money;
    return true;
  }
}

/**
 * Your Bank object will be instantiated and called as such:
 * Bank obj = Bank(balance);
 * bool param1 = obj.transfer(account1,account2,money);
 * bool param2 = obj.deposit(account,money);
 * bool param3 = obj.withdraw(account,money);
 */