import 'package:flutter/material.dart';
import 'package:online_banking_app_ui/components/bank_flip_card.dart';
import 'package:online_banking_app_ui/provider/bank_card_provider.dart';
import 'package:online_banking_app_ui/screens/new_bank_card_screen.dart';
import 'package:online_banking_app_ui/utils/color_constants.dart';
import 'package:provider/provider.dart';

class BankCardsScreen extends StatelessWidget {
  static const String routeName = '/bank-cards-screen';

  const BankCardsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Consumer<BankCardProvider>(
                builder: (_, _bankCardProvider, child) => ListView.separated(
                  shrinkWrap: true,
                  itemCount: _bankCardProvider.bankCardList.length,
                  physics: BouncingScrollPhysics(),
                  separatorBuilder: (context, index) => Divider(color: ColorConstants.transparent, height: 20),
                  itemBuilder: (context, index) => Dismissible(
                    key: Key(_bankCardProvider.bankCardList.elementAt(index).id),
                    onDismissed: (DismissDirection direction) => _bankCardProvider.removeBankCard(_bankCardProvider.bankCardList.elementAt(index)),
                    direction: DismissDirection.endToStart,
                    background: Card(
                      color: ColorConstants.lightRed,
                      semanticContainer: true,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Icon(
                            Icons.delete_outline,
                            color: ColorConstants.white,
                            size: 35,
                          ),
                        ),
                      ),
                    ),
                    child: BankFlipCard(card: _bankCardProvider.bankCardList.elementAt(index), flipOnTouch: true),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _navigateTo(context),
        backgroundColor: ColorConstants.transparent,
        splashColor: ColorConstants.transparent,
        elevation: 0,
        label: Text(
          'Add Card',
          style: Theme.of(context).textTheme.headline3,
        ),
      ),
    );
  }

  void _navigateTo(final BuildContext context) {
    Navigator.of(context).pushNamed(NewBankCardScreen.routeName);
  }
}
