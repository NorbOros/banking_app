import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:online_banking_app_ui/model/transaction.dart';
import 'package:online_banking_app_ui/utils/color_constants.dart';

class TransactionCard extends StatelessWidget {
  final Transaction _transaction;

  const TransactionCard({Key? key, required Transaction transaction})
      : _transaction = transaction,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (() {}),
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
                  child: Image.asset(_transaction.partner.avatar),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        _transaction.partner.name,
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      Text(
                        _transaction.date,
                        style: Theme.of(context).textTheme.headline6,
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
                    Text(
                      _transaction.amount.toString() + _transaction.currency,
                      style: TextStyle(
                        fontSize: Theme.of(context).textTheme.headline3!.fontSize,
                        fontWeight: Theme.of(context).textTheme.headline3!.fontWeight,
                        color: _transaction.amount > 0 ? ColorConstants.green : ColorConstants.red,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          _transaction.currentBalance.toString(),
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        VerticalDivider(
                          color: ColorConstants.transparent,
                          width: 10,
                        ),
                        _transaction.amount > 0
                            ? Icon(
                                FontAwesomeIcons.levelUpAlt,
                                size: 10,
                                color: ColorConstants.green,
                              )
                            : Icon(
                                FontAwesomeIcons.levelDownAlt,
                                size: 10,
                                color: ColorConstants.red,
                              ),
                        Text(
                          _transaction.changePercentage.toString() + '%',
                          style: TextStyle(
                            fontSize: Theme.of(context).textTheme.headline6!.fontSize,
                            fontWeight: Theme.of(context).textTheme.headline6!.fontWeight,
                            color: _transaction.amount > 0 ? ColorConstants.green : ColorConstants.red,
                          ),
                        ),
                      ],
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
