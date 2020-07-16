import 'package:anton_sih_app/core/api/latest_corporate_action.dart';
import 'package:flutter/material.dart';
import '../../widgets/detailsdialog.dart';

class HomeTab extends StatefulWidget {
  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  DetailsDialog dialogs = new DetailsDialog();
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
                child: Text(
                  'Loading...',
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ),
            );
          }
          return ListView.builder(
            shrinkWrap: true,
            itemCount: snapshot.data.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
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
                    Text("Security Code: ${snapshot.data[index].securityName}"),
                    Text("Ex-Date: ${snapshot.data[index].exDate}"),
                    Text("Purpose: ${snapshot.data[index].purpose}"),
                    SizedBox(
                      height: 2,
                    ),
                    Container(
                      width: screenWidth,
                      height: 0.0005 * screenHeight,
                      color: Colors.grey,
                    )
                  ],
                ),
                onTap: () {
                  dialogs.information(context, snapshot.data[index]);
                },
              );
            },
          );
        },
      ),
    );
  }
}
