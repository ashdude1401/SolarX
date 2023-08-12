import 'package:flutter/material.dart';
import '../views/auth.screen.dart';
import '../views/home.screen.dart';

class RoutePath {
  static const String home = '/home';
  static const String auth = '/auth';

  static final routes = {
    auth: (BuildContext context) => const AuthScreen(),
    home: (BuildContext context) => const Home()
    // singlePost: (BuildContext context) => const SinglePost(),
  };

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePath.home:
        return MaterialPageRoute(builder: (_) => const Home());
      case RoutePath.auth:
        return MaterialPageRoute(builder: (_) => const AuthScreen());
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
