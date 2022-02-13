import 'package:flutter/material.dart';
import 'package:online_banking_app_ui/data/partners.dart';
import 'package:online_banking_app_ui/model/partner.dart';

class PartnerProvider with ChangeNotifier {
  final List<Partner> _partnerList = Partners().partners;

  List<Partner> get partnerList => _partnerList;
}
