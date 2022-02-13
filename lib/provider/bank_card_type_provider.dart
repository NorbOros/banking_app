import 'package:flutter/material.dart';
import 'package:online_banking_app_ui/data/bank_card_types.dart';
import 'package:online_banking_app_ui/model/bank_card_type.dart';

class BankCardTypeProvider with ChangeNotifier {
  final List<BankCardType> _bankCardTypeList = BankCardTypes().bankCardTypes;

  List<BankCardType> get bankCardTypeList => _bankCardTypeList;

  void addBankCardType(final BankCardType bankCardType) {
    if (!_bankCardTypeList.contains(bankCardType)) {
      _bankCardTypeList.add(bankCardType);
      notifyListeners();
    }
  }

  void removeBankCardType(final BankCardType bankCardType) {
    if (_bankCardTypeList.contains(bankCardType)) {
      _bankCardTypeList.add(bankCardType);
      notifyListeners();
    }
  }


}
