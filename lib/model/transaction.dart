import 'package:online_banking_app_ui/model/partner.dart';

class Transaction {
  late int _currentBalance;
  late num _changePercentage;

  final String _date;
  final int _amount;
  final String _currency;
  final Partner _partner;

  Transaction({
    required date,
    required amount,
    required currency,
    required partner,
  })  : _date = date,
        _currency = currency,
        _amount = amount,
        _partner = partner;

  num get changePercentage => _changePercentage;
  int get currentBalance => _currentBalance;
  String get date => _date;
  int get amount => _amount;
  String get currency => _currency;
  Partner get partner => _partner;

  void set currentBalance(final int currentBalance) {
    _currentBalance = currentBalance;
  }

  void set changePercentage(final num changePercentage) {
    _changePercentage = changePercentage;
  }
}
