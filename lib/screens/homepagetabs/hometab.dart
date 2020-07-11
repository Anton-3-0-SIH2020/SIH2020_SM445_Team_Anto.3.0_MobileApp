import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../models/corporateaction.dart';
import '../../widgets/detailsdialog.dart';

import 'package:http/http.dart' as http;

class HomeTab extends StatefulWidget {
  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  DetailsDialog dialogs = new DetailsDialog();
  Future<List<CorporateAction>> _getCorporateActions() async {
    print("Inside Function");
    var data = await http
        .get('https://run.mocky.io/v3/af4047f0-2a67-416c-8124-3cc7ec706de2');
    var api = "https://5f01862a07605200169e7069.mockapi.io/corporateactions";
    var jsonData = json.decode(data.body);
    print(jsonData);

    List<CorporateAction> corporateAcions = [];
    for (var u in jsonData) {
      CorporateAction ca = CorporateAction(
          u["secuarity_code"],
          u["secuarity_name"],
          u["ex_date"],
          u["purpose"],
          u["record_date"],
          u["bc_start_date"],
          u["bc_end_date"],
          u["nd_start_date"],
          u["nd_end_date"],
          u["actual_payment_date"]);
      corporateAcions.add(ca);
    }
    print(corporateAcions.length);
    return corporateAcions;
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
        future: _getCorporateActions(),
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
            // separatorBuilder: (context, index) => Divider(),
            itemCount: snapshot.data.length + 1,
            itemBuilder: (BuildContext context, int index) {
              if (index == 0) {
                return Container(
                  height: 0.05 * screenHeight,
                  width: screenWidth,
                  color: Color(0xFFEEEEEE),
                  child: Align(
                    alignment: FractionalOffset.center,
                    child: Text(
                      'Corporate Actions',
                      style: Theme.of(context).textTheme.headline3,
                    ),
                  ),
                );
              }
              index = index - 1;
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
                      snapshot.data[index].security_name,
                      style: Theme.of(context).textTheme.headline2,
                    ),
                    Text(
                        "Security Code: ${snapshot.data[index].security_code}"),
                    Text("Ex-Date: ${snapshot.data[index].ex_date}"),
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
