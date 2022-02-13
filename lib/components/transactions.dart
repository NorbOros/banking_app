import 'package:flutter/material.dart';
import 'package:online_banking_app_ui/components/transaction_card.dart';
import 'package:online_banking_app_ui/model/transaction.dart';
import 'package:online_banking_app_ui/utils/color_constants.dart';

class Transactions extends StatelessWidget {
  final List<Transaction>? _transactionList;

  const Transactions({Key? key, required List<Transaction>? transactionList})
      : _transactionList = transactionList,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: _transactionList!.length,
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      separatorBuilder: (context, index) => Divider(
        height: 10,
        thickness: 0,
        color: ColorConstants.transparent,
      ),
      itemBuilder: (context, index) =>
          TransactionCard(transaction: _transactionList!.elementAt(index)),
    );
  }
}
