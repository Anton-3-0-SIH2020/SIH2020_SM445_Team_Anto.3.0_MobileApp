import 'package:flutter/material.dart';
import 'package:anton_sih_app/route_generator.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      }, //Wrapping MaterialApp in GestureDetector here ensures that keyboard closes every time user clicks out of a TextFormField
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        onGenerateRoute: RouteGenerator.generateRoute,
        theme: ThemeData.light().copyWith(
          primaryColor: Color(0xFF4035EF),
          scaffoldBackgroundColor: Colors.white,
          accentColor: Colors.white,
        ),
      ),
    );
  }
}
