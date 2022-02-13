import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:online_banking_app_ui/components/bank_flip_card.dart';
import 'package:online_banking_app_ui/components/transactions.dart';
import 'package:online_banking_app_ui/model/bank_card.dart';
import 'package:online_banking_app_ui/provider/bank_card_provider.dart';
import 'package:online_banking_app_ui/screens/partner_chooser_screen.dart';
import 'package:online_banking_app_ui/utils/color_constants.dart';
import 'package:provider/provider.dart';

class TransactionsScreen extends StatefulWidget {
  static const String routeName = '/transactions-screen';

  TransactionsScreen({Key? key}) : super(key: key);

  @override
  State<TransactionsScreen> createState() => _TransactionsScreenState();
}

class _TransactionsScreenState extends State<TransactionsScreen> {
  int _cardIndex = 0;

  void _selectBankCard(final int index, final int bankCardListSize) {
    setState(() {
      _cardIndex = index <= bankCardListSize ? index.toInt() : bankCardListSize;
    });
  }

  void _navigateToPartnerChooserScreen(final String route, String bankCardId, final BuildContext context) {
    Navigator.of(context).pushNamed(route, arguments: bankCardId);
  }

  @override
  Widget build(BuildContext context) {
    final BankCardProvider _bankCardProvider = Provider.of<BankCardProvider>(context);
    List<BankCard> _bankCardList = _bankCardProvider.bankCardList;

    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _bankCardList.isNotEmpty
                ? CarouselSlider(
                    options: CarouselOptions(
                      scrollPhysics: BouncingScrollPhysics(),
                      enableInfiniteScroll: false,
                      aspectRatio: 19 / 9,
                      enlargeCenterPage: true,
                      initialPage: 0,
                      autoPlay: false,
                      onScrolled: (index) => _selectBankCard(index!.toInt(), _bankCardList.length),
                    ),
                    items: _bankCardList
                        .map(
                          (myCard) => Builder(
                            builder: (BuildContext context) => BankFlipCard(
                              card: myCard,
                              flipOnTouch: false,
                            ),
                          ),
                        )
                        .toList(),
                  )
                : Container(),
            _bankCardList.isNotEmpty ? Transactions(transactionList: _bankCardList.elementAt(_cardIndex).transactions) : Container()
          ],
        ),
      ),
      floatingActionButton: _bankCardList.isNotEmpty
          ? FloatingActionButton.extended(
              label: Text(
                'New Transaction',
                style: Theme.of(context).textTheme.headline3,
              ),
              onPressed: () => _navigateToPartnerChooserScreen(PartnerChooserScreen.routeName, _bankCardList.elementAt(_cardIndex).id, context),
              backgroundColor: ColorConstants.transparent,
              elevation: 0,
              splashColor: ColorConstants.transparent,
              isExtended: true,
            )
          : null,
    );
  }
}
