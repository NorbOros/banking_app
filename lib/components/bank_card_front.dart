import 'package:flutter/material.dart';
import 'package:online_banking_app_ui/model/bank_card.dart';
import 'package:online_banking_app_ui/utils/color_constants.dart';

class BankCardFront extends StatelessWidget {
  const BankCardFront({Key? key, required BankCard card})
      : _card = card,
        super(key: key);

  final BankCard _card;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 19 / 9,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              _card.cardColor1,
              _card.cardColor2,
            ],
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                _card.title,
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
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              _card.cardNumber.substring(
                                  _card.cardNumber.length - 4,
                                  _card.cardNumber.length),
                              style: Theme.of(context).textTheme.bodyText2,
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
    );
  }
}
