import 'package:online_banking_app_ui/model/bank_card_type.dart';
import 'package:online_banking_app_ui/utils/color_constants.dart';

class BankCardTypes {
  final List<BankCardType> _bankCards = [
    BankCardType(name: 'Virtual', color1: ColorConstants.cardBackground1, color2: ColorConstants.cardBackground2),
    BankCardType(name: 'Virtual disposable', color1: ColorConstants.cardBackground1, color2: ColorConstants.cardBackground2),
  ];
  List<BankCardType> get bankCardTypes => _bankCards;
}
