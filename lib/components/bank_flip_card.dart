import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:online_banking_app_ui/components/bank_card_back.dart';
import 'package:online_banking_app_ui/components/bank_card_front.dart';
import 'package:online_banking_app_ui/model/bank_card.dart';

class BankFlipCard extends StatelessWidget {
  final BankCard _card;
  final bool _flipOnTouch;

  BankFlipCard({Key? key, required BankCard card, required bool flipOnTouch})
      : _card = card,
        _flipOnTouch = flipOnTouch,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlipCard(
      flipOnTouch: _flipOnTouch,
      fill: Fill.fillBack,
      direction: FlipDirection.HORIZONTAL,
      front: BankCardFront(card: _card),
      back: BankCardBack(card: _card),
    );
  }
}
