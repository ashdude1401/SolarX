import 'package:flutter/material.dart';

class MarketPlace extends StatelessWidget {
  const MarketPlace({super.key});

  static const routeName = '/marketplace';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("Market Place")),
    );
  }
}
