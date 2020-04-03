import 'package:flutter/material.dart';
import './screens/landingpage.dart';

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
          home: LandingPage()
      ),
    );
  }
}