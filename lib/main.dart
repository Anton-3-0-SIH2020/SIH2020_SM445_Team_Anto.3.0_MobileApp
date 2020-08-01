import 'package:flutter/material.dart';
import 'package:anton_sih_app/core/route/route_generator.dart';
import 'package:flutter/services.dart';

import 'package:google_fonts/google_fonts.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: true,
        initialRoute: '/',
        onGenerateRoute: RouteGenerator.generateRoute,
        theme: ThemeData.light().copyWith(
          primaryColor: Color(0xff3F72F9),
          scaffoldBackgroundColor: Colors.white,
          accentColor: Colors.white,
          textTheme: TextTheme(
            headline1: GoogleFonts.raleway(
              color: Colors.black,
              fontSize: 35,
              fontWeight: FontWeight.w500,
            ),
            headline2: GoogleFonts.raleway(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
            headline3: GoogleFonts.raleway(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
            subtitle1: GoogleFonts.raleway(
              color: Colors.grey,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            subtitle2: GoogleFonts.raleway(
              color: Colors.grey,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
            caption: GoogleFonts.raleway(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
            bodyText1: GoogleFonts.raleway(
              color: Colors.grey,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
            bodyText2: GoogleFonts.raleway(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
