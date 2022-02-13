import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:online_banking_app_ui/components/partner_card.dart';
import 'package:online_banking_app_ui/model/new_transaction.dart';
import 'package:online_banking_app_ui/model/transaction.dart';
import 'package:online_banking_app_ui/provider/bank_card_provider.dart';
import 'package:online_banking_app_ui/screens/partner_chooser_screen.dart';
import 'package:online_banking_app_ui/utils/color_constants.dart';
import 'package:provider/provider.dart';

class NewTransactionScreen extends StatefulWidget {
  NewTransactionScreen({Key? key}) : super(key: key);

  static const String routeName = '/new-transaction-screen';

  @override
  State<NewTransactionScreen> createState() => _NewTransactionScreenState();
}

class _NewTransactionScreenState extends State<NewTransactionScreen> {
  final _formKey = GlobalKey<FormState>();
  late int _amount;

  void _sendNewTransaction(
    final BuildContext context,
    final BankCardProvider bankCardProvider,
    final NewTransaction newTransaction,
    final GlobalKey<FormState> formKey,
  ) {
    _validateAndSaveForm(formKey);

    bankCardProvider.addTransaction(
        newTransaction.bankCardId,
        Transaction(
          date: DateFormat.MMMMd().format(DateTime.now()),
          amount: _amount * -1,
          currency: '\$',
          partner: newTransaction.partner,
        ));
    Navigator.of(context).pop();
  }

  void _validateAndSaveForm(final GlobalKey<FormState> formKey) {
    if (!formKey.currentState!.validate()) {
      return;
    }
    formKey.currentState?.save();
  }

  void _navigateTo(final BuildContext context, final String routeName, final String bankCardId) {
    Navigator.of(context).popAndPushNamed(routeName, arguments: bankCardId);
  }

  @override
  Widget build(BuildContext context) {
    final BankCardProvider _bankCardProvider = Provider.of<BankCardProvider>(context, listen: false);
    final NewTransaction _newTransaction = ModalRoute.of(context)!.settings.arguments as NewTransaction;

    _amountValidator(String? value) {
      if (value == null) {
        return 'Ammount cannot be empty.';
      } else if (int.parse(value) <= 0) {
        return 'Ammount must be greter than zero.';
      }
      return null;
    }

    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'New Trasnaction',
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  IconButton(
                      onPressed: () => _navigateTo(context, PartnerChooserScreen.routeName, _newTransaction.bankCardId),
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: ColorConstants.black,
                      ))
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40, bottom: 30),
                child: PartnerCard(partner: _newTransaction.partner, bankCardId: '', navigation: false),
              ),
              TextFormField(
                validator: (value) => _amountValidator(value),
                onSaved: (value) => {_amount = int.parse(value!)},
                style: Theme.of(context).textTheme.headline3,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Amount',
                  prefixIcon: const Icon(Icons.attach_money, color: ColorConstants.inputBoxIcon),
                  fillColor: ColorConstants.inputFillColor,
                  filled: true,
                  isDense: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide.none,
                  ),
                ),
                autocorrect: false,
              ),
            ]),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text(
          'Send',
          style: Theme.of(context).textTheme.headline3,
        ),
        onPressed: () => _sendNewTransaction(context, _bankCardProvider, _newTransaction, _formKey),
        backgroundColor: ColorConstants.transparent,
        splashColor: ColorConstants.transparent,
        elevation: 0,
      ),
    );
  }
}
