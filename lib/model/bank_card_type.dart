import 'package:flutter/material.dart';

class BankCardType {
  final String _name;
  final Color _color1;
  final Color _color2;

  BankCardType({required String name, required Color color1, required Color color2})
      : _name = name,
        _color1 = color1,
        _color2 = color2;

  String get name => _name;
  Color get color1 => _color1;
  Color get color2 => _color2;

}
