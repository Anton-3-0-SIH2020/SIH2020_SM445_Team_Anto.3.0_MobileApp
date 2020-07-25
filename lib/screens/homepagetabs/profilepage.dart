import 'package:firebase_auth/firebase_auth.dart';
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
    return Column(
      children: <Widget>[
        Center(
          child: Padding(
            padding: EdgeInsets.fromLTRB(12, 20, 12, 0),
            child: Container(
              height: 0.32 * screenHeight,
              width: 0.8 * screenWidth,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0.0, 1.0), //(x,y)
                    blurRadius: 6.0,
                  ),
                ],
              ),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                    child: Icon(
                      Icons.person,
                      size: 125,
                    ),
                  ),
                  Text(
                    'John Wick',
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'johnwick@gmail.com',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    '+91 9992124325',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: 80,
        ),
        Container(
          height: 0.05 * screenHeight,
          width: 0.8 * screenWidth,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0.0, 1.0), //(x,y)
                blurRadius: 6.0,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
            child: Align(
              alignment: FractionalOffset.centerLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Notifications',
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  Switch(
                    value: isSwitched,
                    onChanged: (value) {
                      setState(() {
                        isSwitched = value;
                        print(isSwitched);
                      });
                    },
                    activeTrackColor: Colors.deepPurple[100],
                    activeColor: Color(0xFF4035EF),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Container(
          height: 0.05 * screenHeight,
          width: 0.8 * screenWidth,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0.0, 1.0), //(x,y)
                blurRadius: 6.0,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
            child: Align(
              alignment: FractionalOffset.centerLeft,
              child: InkWell(
                onTap: () {
                  FirebaseAuth.instance.signOut().then((value) {
                    Navigator.of(context).pushReplacementNamed('/');
                  }).catchError((e) {
                    print(e);
                  });
                },
                child: Text(
                  'Logout',
                  style: Theme.of(context).textTheme.headline3,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
