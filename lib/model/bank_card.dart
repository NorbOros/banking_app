import 'package:flutter/material.dart';
import 'package:online_banking_app_ui/model/transaction.dart';

class BankCard {
  final String _id;
  final String _title;
  final String _cardHolderName;
  final String _cardNumber;
  final String _expDate;
  final String _cvv;
  final Color _cardColor1;
  final Color _cardColor2;
  int _currentBalance;
  final List<Transaction> _transactions;

  BankCard({
    required String id,
    required String title,
    required String cardHolderName,
    required String cardNumber,
    required String cvv,
    required String expDate,
    required Color cardColor1,
    required Color cardColor2,
    required int currentBalance,
    required List<Transaction> transaction,
  })  : _id = id,
        _title = title,
        _cardHolderName = cardHolderName,
        _cardNumber = cardNumber,
        _expDate = expDate,
        _cvv = cvv,
        _cardColor1 = cardColor1,
        _cardColor2 = cardColor2,
        _currentBalance = currentBalance,
        _transactions = transaction;

  String get id => _id;
  String get title => _title;
  String get cardHolderName => _cardHolderName;
  String get cardNumber => _cardNumber;
  String get expDate => _expDate;
  String get cvv => _cvv;
  Color get cardColor1 => _cardColor1;
  Color get cardColor2 => _cardColor2;
  int get currentBalance => _currentBalance;
  List<Transaction> get transactions => _transactions;

  void updateCurrentBalance(final int ammount) {
    _currentBalance = _currentBalance + ammount;
  }

}
