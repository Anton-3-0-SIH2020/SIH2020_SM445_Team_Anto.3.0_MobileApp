import 'package:anton_sih_app/core/api/latest_corporate_action.dart';
import 'package:anton_sih_app/core/db_helper/external_db_helper.dart';
import 'package:anton_sih_app/models/bse_ca.dart';
import 'package:anton_sih_app/screens/homepagetabs/favourites.dart';
import 'package:flutter/material.dart';
import 'package:anton_sih_app/screens/homepagetabs/hometab.dart';
import '../screens/homepagetabs/profilepage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final tabs = [HomeTab(), FavouritesTab(), ProfilePage()];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    External_Database_Manager manager = new External_Database_Manager();
    manager.Transfer_Data();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        iconTheme: IconThemeData(color: Color(0xff24213F)),
        elevation: 0,
        backgroundColor: Color(0xffF3F5F7),
        title: Text(
          'ANTON',
          style: TextStyle(
            color: Color(0xff24213F),
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(10.0),
          child: Theme(
            data: Theme.of(context).copyWith(accentColor: Colors.white),
            child: Opacity(
              opacity: 0.4,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                height: 0.5,
                color: Color(0xff24213F),
              ),
            ),
          ),
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
