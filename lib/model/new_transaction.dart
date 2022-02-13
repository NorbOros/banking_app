import 'package:online_banking_app_ui/model/partner.dart';

class NewTransaction {
  final Partner _partner;
  final String _bankCardId;

  NewTransaction({required Partner partner, required String bankCardId})
      : _partner = partner,
        _bankCardId = bankCardId;

  Partner get partner => _partner;
  String get bankCardId => _bankCardId;
}
