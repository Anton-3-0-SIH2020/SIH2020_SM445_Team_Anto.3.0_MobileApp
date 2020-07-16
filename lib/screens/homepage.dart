import 'package:anton_sih_app/core/api/latest_corporate_action.dart';
import 'package:anton_sih_app/models/bse_ca.dart';
import 'package:flutter/material.dart';
import 'package:anton_sih_app/screens/homepagetabs/hometab.dart';
import '../screens/homepagetabs/profilepage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final tabs = [HomeTab(), null, ProfilePage()];

  @override
  void initState() {
    // TODO: implement initState
    getCa();
    super.initState();
  }

  void getCa() async {
    BseLatestCa bseLatestCa = new BseLatestCa();
    List<BseCa> bseCa = await bseLatestCa.getLatestCa();
    print(bseCa[0].securityName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ANTON',
          style: Theme.of(context).textTheme.caption,
        ),
      ),
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text(
              'Home',
              style: Theme.of(context).textTheme.subtitle2,
            ),
            backgroundColor: Color(0xFF4035EF),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            title: Text(
              'Favourites',
              style: Theme.of(context).textTheme.subtitle2,
            ),
            backgroundColor: Color(0xFF4035EF),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text(
              'Profile',
              style: Theme.of(context).textTheme.subtitle2,
            ),
            backgroundColor: Color(0xFF4035EF),
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
