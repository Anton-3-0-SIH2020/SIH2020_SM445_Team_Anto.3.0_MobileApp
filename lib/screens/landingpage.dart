import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
                  'Anton',
                  style: Theme.of(context).textTheme.headline1,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Corporate Actions',
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                Text(
                  'Brought to you instantly ',
                  style: Theme.of(context).textTheme.subtitle1,
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
                    Navigator.of(context).pushNamed('/signin');
                  },
                  child: Container(
                    height: screenHeight * 0.075,
                    width: screenWidth * 0.35,
                    decoration: BoxDecoration(
                        color: Color(0xff3F72F9),
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
                    Navigator.of(context).pushNamed('/signup');
                  },
                  child: Container(
                    height: screenHeight * 0.075,
                    width: screenWidth * 0.35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      border: Border.all(
                        color: Color(0xff3F72F9),
                        width: 1,
                      ),
                    ),
                    child: Center(
                        child: Text(
                      'Sign up',
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xff3F72F9),
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
