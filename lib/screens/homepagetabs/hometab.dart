import 'package:anton_sih_app/core/api/latest_corporate_action.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../widgets/detailsdialog.dart';

class HomeTab extends StatefulWidget {
  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  BseLatestCa bseLatestCa;
  @override
  void initState() {
    // TODO: implement initState
    bseLatestCa = new BseLatestCa();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xffF3F5F7),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: null,
        icon: Icon(Icons.save),
        label: Text("PDF"),
        backgroundColor: Color(0xFF4035EF),
      ),
      body: FutureBuilder(
        future: bseLatestCa.getLatestCa(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return Container(
              child: Center(
                child: SpinKitDoubleBounce(
                  color: Color(0xff3F72F9),
                  size: 60.0,
                ),
              ),
            );
          }
          return ListView.builder(
            padding: EdgeInsets.only(top: 10),
            shrinkWrap: true,
            itemCount: snapshot.data.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white,
                ),
                child: ListTile(
                  leading: Container(
                    height: 0.05 * screenHeight,
                    width: 0.1 * screenWidth,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('images/bonds.png'),
                          fit: BoxFit.cover),
                    ),
                  ),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        snapshot.data[index].securityName,
                        style: Theme.of(context).textTheme.headline2,
                      ),
                      Text(
                          "Security Code: ${snapshot.data[index].securityCode}"),
                      Text("Ex-Date: ${snapshot.data[index].exDate}"),
                      Text("Purpose: ${snapshot.data[index].purpose}"),
                      SizedBox(
                        height: 2,
                      ),
//                      Container(
//                        width: screenWidth,
//                        height: 0.0005 * screenHeight,
//                        color: Colors.grey,
//                      )
                    ],
                  ),
                  onTap: () {
                    // dialogs.information(context, snapshot.data[index]);
                    Navigator.of(context).pushNamed('/detailspage',
                        arguments: snapshot.data[index]);
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
