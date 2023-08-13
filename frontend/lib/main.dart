import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frontend/views/home.screen.dart';

import 'constants/routes.dart';
import 'constants/themedata.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// import 'views/onboarding.screen.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.dark,
      systemNavigationBarColor: Color.fromARGB(255, 0, 0, 0),
      systemNavigationBarDividerColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.light,
    ),
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SolarX',
      theme: CustomTheme.lightTheme(),
      darkTheme: CustomTheme.darkTheme(),
      themeMode: ThemeMode.light,
      routes: RoutePath.routes,
      onGenerateRoute: RoutePath.generateRoute,
      debugShowCheckedModeBanner: false,

      // home: const OnBoarding(),

      home: const Home(),
      // home: const ChatScreen(),
      // home: const Home(),
    );
  }
}
