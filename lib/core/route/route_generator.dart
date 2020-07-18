import 'package:flutter/material.dart';

import '../../screens/landingpage.dart';
import '../../screens/signin.dart';
import '../../screens/signup.dart';
import 'package:anton_sih_app/screens/homepage.dart';
import 'package:anton_sih_app/screens/detailspage.dart';
import 'package:anton_sih_app/models/bse_ca.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => LandingPage());
      case '/signin':
        return MaterialPageRoute(builder: (_) => SignIn());
      case '/signup':
        return MaterialPageRoute(builder: (_) => SignUp());
      case '/homepage':
        return MaterialPageRoute(builder: (_) => HomePage());
      case '/detailspage':
        if (args is BseCa) {
          return MaterialPageRoute(
            builder: (_) => DetailsPage(
              data: args,
            ),
          );
        }
        return _errorRoute();
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
