import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'signin.dart';
import 'signup.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        height: screenHeight,
        width: screenWidth,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Column(
              children: <Widget>[
                Text(
                  'Anton 3.0',
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 40),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Corporate Actions',
                  style: TextStyle(fontSize: 15),
                ),
                Text(
                  'Brought to you instantly ',
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
            Container(
              height: screenHeight * 0.40,
              width: screenWidth,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/landingpage.png'),
                    fit: BoxFit.cover),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) {
                          return SignUp();
                        },
                      ),
                    );
                  },
                  child: Container(
                    height: screenHeight * 0.075,
                    width: screenWidth * 0.35,
                    decoration: BoxDecoration(
                        color: Color(0xFF4035EF),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Center(
                        child: Text(
                      'Sign in',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    )),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) {
                          return SignIn();
                        },
                      ),
                    );
                  },
                  child: Container(
                    height: screenHeight * 0.075,
                    width: screenWidth * 0.35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      border: Border.all(
                        color: Color(0xFF4035EF),
                        width: 1,
                      ),
                    ),
                    child: Center(
                        child: Text(
                      'Sign up',
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xFF4035EF),
                      ),
                    )),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
