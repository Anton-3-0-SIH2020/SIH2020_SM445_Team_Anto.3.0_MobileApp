import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'signin.dart';

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Color(0xffF3F5F7),
        resizeToAvoidBottomPadding: false,
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
            Widget>[
          Container(
            child: Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(40.0, 110.0, 0.0, 0.0),
                  child: Text(
                    'Sign up',
                    style: TextStyle(
                        fontSize: 60.0,
                        fontWeight: FontWeight.w900,
                        color: Colors.black54),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(260.0, 130.0, 0.0, 0.0),
                  child: Container(
                    margin: EdgeInsets.only(top: 30, left: 2),
                    height: 17,
                    width: 17,
                    decoration: BoxDecoration(
                        color: Color(0xff3F72F9),
                        borderRadius: BorderRadius.circular(60)),
                  ),
                )
              ],
            ),
          ),
          Container(
              padding: EdgeInsets.only(top: 100.0, left: 40.0, right: 40.0),
              child: Column(
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.mail),
                        labelText: 'Email',
                        labelStyle: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                        // hintText: 'EMAIL',
                        // hintStyle: ,
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff3F72F9)))),
                  ),
                  SizedBox(height: 20.0),
                  TextField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: Icon(Icons.remove_red_eye),
                        labelText: 'Password ',
                        labelStyle: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff3F72F9)))),
                    obscureText: true,
                  ),
                  SizedBox(height: 20.0),
                  TextField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        labelText: 'Full Name',
                        labelStyle: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff3F72F9)))),
                  ),
                  SizedBox(height: 50.0),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 25.0),
                    width: double.infinity,
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('/homepage');
                      },
                      color: Color(0xff3F72F9),
                      padding: EdgeInsets.all(15.0),
                      elevation: 5.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Text(
                        'SIGNUP',
                        style: TextStyle(
                          color: Colors.white,
                          letterSpacing: 1.5,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'OpenSans',
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 5.0),
                    width: double.infinity,
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      color: Colors.white,
                      padding: EdgeInsets.all(15.0),
                      elevation: 5.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Text(
                        'GO BACK',
                        style: TextStyle(
                          color: Color(0xff3F72F9),
                          letterSpacing: 1.5,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'OpenSans',
                        ),
                      ),
                    ),
                  ),
//                  Container(
//                      height: 40.0,
//                      child: Material(
//                        borderRadius: BorderRadius.circular(20.0),
//                        shadowColor: Color(0xff3F72F9),
//                        color: Color(0xff3F72F9),
//                        elevation: 7.0,
//                        child: GestureDetector(
//                          onTap: () {},
//                          child: Center(
//                            child: Text(
//                              'SIGNUP',
//                              style: TextStyle(
//                                  color: Colors.white,
//                                  fontWeight: FontWeight.bold,
//                                  fontFamily: 'Montserrat'),
//                            ),
//                          ),
//                        ),
//                      )),
//                  SizedBox(height: 20.0),
//                  Container(
//                    height: 40.0,
//                    color: Colors.transparent,
//                    child: Container(
//                      decoration: BoxDecoration(
//                          border: Border.all(
//                              color: Color(0xff3F72F9),
//                              style: BorderStyle.solid,
//                              width: 1.0),
//                          color: Colors.transparent,
//                          borderRadius: BorderRadius.circular(20.0)),
//                      child: InkWell(
//                        onTap: () {
//                          Navigator.of(context).pop();
//                        },
//                        child: Center(
//                          child: Text('Go Back',
//                              style: TextStyle(
//                                  color: Color(0xff3F72F9),
//                                  fontWeight: FontWeight.bold,
//                                  fontFamily: 'Montserrat')),
//                        ),
//                      ),
//                    ),
//                  ),
                ],
              )),
          // SizedBox(height: 15.0),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: <Widget>[
          //     Text(
          //       'New to Spotify?',
          //       style: TextStyle(
          //         fontFamily: 'Montserrat',
          //       ),
          //     ),
          //     SizedBox(width: 5.0),
          //     InkWell(
          //       child: Text('Register',
          //           style: TextStyle(
          //               color: Colors.green,
          //               fontFamily: 'Montserrat',
          //               fontWeight: FontWeight.bold,
          //               decoration: TextDecoration.underline)),
          //     )
          //   ],
          // )
        ]));
  }
}
