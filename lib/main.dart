import 'package:flutter/material.dart';
import 'package:online_banking_app_ui/provider/bank_card_provider.dart';
import 'package:online_banking_app_ui/provider/bank_card_type_provider.dart';
import 'package:online_banking_app_ui/provider/partner_provider.dart';
import 'package:online_banking_app_ui/screens/bank_cards_screen.dart';
import 'package:online_banking_app_ui/screens/home_scren.dart';
import 'package:online_banking_app_ui/screens/error_screen.dart';
import 'package:online_banking_app_ui/screens/new_bank_card_screen.dart';
import 'package:online_banking_app_ui/screens/new_transaction_screen.dart';
import 'package:online_banking_app_ui/screens/partner_chooser_screen.dart';
import 'package:online_banking_app_ui/screens/transactions_screen.dart';
import 'package:online_banking_app_ui/utils/theme_data_light.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BankCardProvider()),
        ChangeNotifierProvider(create: (_) => BankCardTypeProvider()),
        ChangeNotifierProvider(create: (_) => PartnerProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Banking App',
        theme: ThemeDataLight.getThemeData(),
        home: HomeScreen(),
        routes: {
          HomeScreen.routeName:(context) => HomeScreen(),
          BankCardsScreen.routeName: (context) => BankCardsScreen(),
          NewBankCardScreen.routeName: (context) => NewBankCardScreen(),
          TransactionsScreen.routeName: (context) => TransactionsScreen(),
          PartnerChooserScreen.routeName: (context) => PartnerChooserScreen(),
          NewTransactionScreen.routeName: (context) => NewTransactionScreen()
        },
        onGenerateRoute: (settings) {
          return MaterialPageRoute(builder: (ctx) => const ErrorScreen());
        },
        onUnknownRoute: (settings) {
          return MaterialPageRoute(builder: (ctx) => const ErrorScreen());
        },
      ),
    );
  }
}
