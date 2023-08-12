import 'package:flutter/material.dart';

class Calculator extends StatelessWidget {
  const Calculator({super.key});

  static const routeName = '/calculator';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("Calculator")),
    );
  }
}
