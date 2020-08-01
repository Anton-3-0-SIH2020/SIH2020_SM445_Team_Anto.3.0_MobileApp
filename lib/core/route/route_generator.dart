import 'package:anton_sih_app/models/mc_ca.dart';
import 'package:anton_sih_app/models/nse_ca.dart';
import 'package:anton_sih_app/screens/companies_page.dart';
import 'package:anton_sih_app/screens/companycalist.dart';
import 'package:anton_sih_app/screens/details_pages/bsedetailpage.dart';
import 'package:anton_sih_app/screens/details_pages/mcdetailpage.dart';
import 'package:anton_sih_app/screens/details_pages/nsedetailpage.dart';
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
      case '/bsedetailspage':
        if (args is BseCa) {
          return MaterialPageRoute(
            builder: (_) => BseDetailsPage(
              data: args,
            ),
          );
        }
        return _errorRoute();
      case '/nsedetailspage':
        if (args is NseCa) {
          return MaterialPageRoute(
            builder: (_) => NseDetailsPage(
              data: args,
            ),
          );
        }
        return _errorRoute();
      case '/mcdetailspage':
        if (args is McCa) {
          return MaterialPageRoute(
            builder: (_) => McDetailsPage(
              data: args,
            ),
          );
        }
        return _errorRoute();
      case '/companiespage':
        return MaterialPageRoute(builder: (_) => CompaniesPage());
      case '/companycalist':
        return MaterialPageRoute(
          builder: (_) => CompanyCaList(
            company: args,
          ),
        );
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
