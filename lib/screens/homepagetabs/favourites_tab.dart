import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/companiespage');
        },
        backgroundColor: Color(0xff3F72F9),
        child: Icon(Icons.add),
      ),
      backgroundColor: Color(0xffF3F5F7),
      body: Container(
        child: Center(
          child: Image.asset('images/no_data.png'),
        ),
      ),
    );
  }
}
