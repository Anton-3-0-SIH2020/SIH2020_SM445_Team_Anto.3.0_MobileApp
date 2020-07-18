import 'package:anton_sih_app/core/api/favourite_corporate_action.dart';
import 'package:flutter/material.dart';
import 'package:anton_sih_app/models/bse_ca.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CompanyCaList extends StatefulWidget {
  final String secCode;

  CompanyCaList({
    Key key,
    @required this.secCode,
  }) : super(key: key);

  @override
  _CompanyCaListState createState() => _CompanyCaListState();
}

class _CompanyCaListState extends State<CompanyCaList> {
  BseFavCa bseFavCa;
  List<BseCa> bseFavList;
  Future<List<BseCa>> bseList;

  @override
  void initState() {
    //BSE
    bseFavCa = new BseFavCa();
    bseList = bseFavCa.getFavCa(widget.secCode);
    bseFavList = [];
    initializer();
    super.initState();
  }

  void initializer() async {
    bseFavList = await bseList;
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xffF3F5F7),
      appBar: AppBar(
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
      body: FutureBuilder(
        future: bseList,
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
            itemCount: bseFavList.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white,
                ),
                child: ListTile(
                  onTap: () {
                    // dialogs.information(context, snapshot.data[index]);
                    Navigator.of(context).pushNamed('/bsedetailspage',
                        arguments: bseFavList[index]);
                  },
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
                        bseFavList[index].securityName,
                        style: Theme.of(context).textTheme.headline2,
                      ),
                      Text("Security Code: ${bseFavList[index].securityCode}"),
                      Text("Ex-Date: ${bseFavList[index].exDate}"),
                      Text("Purpose: ${bseFavList[index].purpose}"),
                      SizedBox(
                        height: 2,
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
