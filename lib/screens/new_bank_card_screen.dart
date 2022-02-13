import 'package:flutter/material.dart';
import 'package:online_banking_app_ui/components/new_bank_card_sample.dart';
import 'package:online_banking_app_ui/provider/bank_card_type_provider.dart';
import 'package:online_banking_app_ui/utils/color_constants.dart';
import 'package:provider/provider.dart';

class NewBankCardScreen extends StatelessWidget {
  static const String routeName = '/new-bank-cards-screen';

  const NewBankCardScreen({Key? key}) : super(key: key);
  void _navigateBack(final BuildContext context) {
    Navigator.of(context).pop(routeName);
  }

  @override
  Widget build(BuildContext context) {
    final BankCardTypeProvider _bankCardTypeProvider = Provider.of<BankCardTypeProvider>(context);

    return Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 18.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Choose Crad Type',
                        style: Theme.of(context).textTheme.headline2,
                      ),
                      IconButton(
                          onPressed: () => _navigateBack(context),
                          icon: Icon(
                            Icons.arrow_back_ios,
                            color: ColorConstants.black,
                          ))
                    ],
                  ),
                ),
                Expanded(
                    child: ListView.separated(
                        itemBuilder: (context, index) => NewBankCardSample(bankCardType: _bankCardTypeProvider.bankCardTypeList.elementAt(index)),
                        separatorBuilder: (context, index) => Divider(height: 10),
                        itemCount: _bankCardTypeProvider.bankCardTypeList.length))
              ],
            ),
          ),
        ),
        backgroundColor: ColorConstants.white);
  }
}
