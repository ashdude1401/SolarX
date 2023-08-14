import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:flutter/material.dart';


class Auth0Service{
  Credentials? _credentials;

static const  appScheme = 'https';

static const  String domain = "dev-uqntq2kucp3u7itx.us.auth0.com";
static const String clientId = "Z2x5FeRQAhn6tHWAAPBvfqehEECikAFk";

Auth0 auth0 = Auth0(domain, clientId);

Future<void> logoutAction() async {
  await auth0.webAuthentication(scheme: appScheme).logout();

  _credentials = null;
}

Future<void> loginAction() async {
  try {
    final Credentials credentials =
        await auth0.webAuthentication(scheme: appScheme).login();

    _credentials = credentials;
  } on Exception catch (e, s) {
    debugPrint('login error: $e - stack: $s');
  }
}


}
