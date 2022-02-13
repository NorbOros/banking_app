import 'package:flutter/material.dart';
import 'package:online_banking_app_ui/components/custom_app_bar.dart';
import 'package:online_banking_app_ui/screens/transactions_screen.dart';

import 'bank_cards_screen.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home-screen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: CustomAppBar(),
        body: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: TabBarView(
            children: [
              TransactionsScreen(),
              BankCardsScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
