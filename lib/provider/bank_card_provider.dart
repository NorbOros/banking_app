import 'package:flutter/material.dart';
import 'package:online_banking_app_ui/model/bank_card.dart';
import 'package:online_banking_app_ui/model/transaction.dart';
import 'package:online_banking_app_ui/utils/color_constants.dart';
import 'package:uuid/uuid.dart';

class BankCardProvider with ChangeNotifier {
  late List<BankCard> _bankCardList = [];
  var _uuid = Uuid();

  List<BankCard> get bankCardList => _bankCardList;

  void addBankCard(final BankCard bankCard) {
    if (!_bankCardList.contains(bankCard)) {
      _bankCardList.add(bankCard);
      notifyListeners();
    }
  }

  void generateNewBankCard(final String title) {
    _bankCardList.add(BankCard(
        id: _uuid.v1(),
        title: title,
        cardHolderName: 'Holder Name',
        cardNumber: '1234 1324 4568 9578',
        cvv: '957',
        expDate: '12/21',
        cardColor1: ColorConstants.cardBackground1,
        cardColor2: ColorConstants.cardBackground2,
        currentBalance: 1000,
        transaction: []));
    notifyListeners();
  }

  void removeBankCard(final BankCard bankCard) {
    if (_bankCardList.contains(bankCard)) {
      _bankCardList.remove(bankCard);
      notifyListeners();
    }
  }

  void addTransaction(final String bankCardId, final Transaction transaction) {
    final BankCard _bankCard = _bankCardList.firstWhere((element) => element.id == bankCardId);
    transaction.changePercentage = (transaction.amount / _bankCard.currentBalance * 100).roundToDouble();
    _bankCard.updateCurrentBalance(transaction.amount);
    transaction.currentBalance = _bankCard.currentBalance;
    _bankCard.transactions.add(transaction);
    notifyListeners();
  }
}
