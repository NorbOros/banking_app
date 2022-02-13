import 'package:flutter/material.dart';
import 'package:online_banking_app_ui/model/new_transaction.dart';
import 'package:online_banking_app_ui/model/partner.dart';
import 'package:online_banking_app_ui/screens/new_transaction_screen.dart';

class PartnerCard extends StatelessWidget {
  final Partner _partner;
  final String _bankCardId;
  final bool _navigation;

  const PartnerCard({Key? key, required Partner partner, required String bankCardId, required bool navigation})
      : _partner = partner,
        _bankCardId = bankCardId,
        _navigation = navigation,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    void _navigateToNewScreen(final String route, final BuildContext context, Partner partner, String bankCardId) {
      Navigator.of(context).popAndPushNamed(route, arguments: NewTransaction(partner: partner, bankCardId: bankCardId));
    }

    return InkWell(
      onTap: _navigation ? () => _navigateToNewScreen(NewTransactionScreen.routeName, context, _partner, _bankCardId) : null,
      child: Container(
        padding: EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  height: 60,
                  width: 60,
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Image.asset(_partner.avatar),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        _partner.name,
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
