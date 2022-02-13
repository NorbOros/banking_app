import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  static const String routeName = '/error-screen';

  const ErrorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Ups, some unexpected error happened..'),
      ),
    );
  }
}
