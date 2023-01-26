class Balance {
  final int questionBalance;

  Balance({this.questionBalance = 0});
}


class ListOfBalance {
  static int _balanceCounter = 0;

  final List<Balance> _balance = [
    Balance(questionBalance: 10),
    Balance(questionBalance: 20),
    Balance(questionBalance: 30),
    Balance(questionBalance: 50),
    Balance(questionBalance: 60),
    Balance(questionBalance: 60),
    Balance(questionBalance: 70),
    Balance(questionBalance: 80),
    Balance(questionBalance: 90),
    Balance(questionBalance: 100),
  ];


  void resetBalanceCounter() => _balanceCounter = 0;


  int getNewBalance() {
    _balanceCounter++;
    return _balance[_balanceCounter - 1].questionBalance;
  }

  int getCurrentBalance() {
    if (_balanceCounter > 0) {
      return _balance[_balanceCounter - 1].questionBalance;
    } else {
      return 0;
    }
  }
  int isLoss() {

      return getCurrentBalance() ;

  }
}
