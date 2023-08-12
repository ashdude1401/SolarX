import 'package:flutter/material.dart';
import 'package:frontend/views/calculator.dart';
import 'package:frontend/views/connect_with_expert.dart';
import '../views/home.screen.dart';
import '../views/market_place.dart';

class RoutePath {
  static const String home = '/home';
  static const String auth = '/auth';
  static const String markertplace = '/marketplace';
  static const String calculator = '/calculator';
  static const String connectWithUser = '/connect_with_user';

  static final routes = {
    home: (BuildContext context) => const Home(),
    markertplace: (BuildContext context) => const MarketPlace(),
    calculator: (BuildContext context) => const Calculator(),
    connectWithUser: (BuildContext context) => const ConnectWithExpert()
  };

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePath.home:
        return MaterialPageRoute(builder: (_) => const Home());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
