import 'package:flutter/material.dart';
import 'package:online_banking_app_ui/model/bank_card_type.dart';
import 'package:online_banking_app_ui/provider/bank_card_provider.dart';
import 'package:online_banking_app_ui/utils/color_constants.dart';
import 'package:provider/provider.dart';

class NewBankCardSample extends StatelessWidget {
  final BankCardType _bankCardType;

  const NewBankCardSample({Key? key, required BankCardType bankCardType})
      : _bankCardType = bankCardType,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final BankCardProvider _bankCardProvider = Provider.of<BankCardProvider>(context, listen: false);

    return InkWell(
      onTap: (() {
        _bankCardProvider.generateNewBankCard(_bankCardType.name);
        Navigator.of(context).pop();
      }),
      child: AspectRatio(
        aspectRatio: 19 / 9,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                _bankCardType.color1,
                _bankCardType.color2,
              ],
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              _bankCardType.name,
              style: Theme.of(context).textTheme.headline1,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          '\u2217\u2217\u2217\u2217',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            '\u2217\u2217\u2217\u2217',
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            '\u2217\u2217\u2217\u2217',
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ),
                      ],
                    ),
                    RotatedBox(
                      quarterTurns: 1,
                      child: Icon(
                        Icons.wifi_outlined,
                        color: ColorConstants.white,
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'VALID THRU',
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                        Text(
                          '\u2217\u2217/\u2217\u2217',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ],
                    ),
                    VerticalDivider(
                      color: ColorConstants.transparent,
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'CVV',
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                        Text(
                          '\u2217\u2217\u2217',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
