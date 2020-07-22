import 'package:anton_sih_app/core/api/company_corporate_action.dart';
import 'package:anton_sih_app/models/companies.dart';
import 'package:anton_sih_app/models/mc_ca.dart';
import 'package:anton_sih_app/models/nse_ca.dart';
import 'package:flutter/material.dart';
import 'package:anton_sih_app/models/bse_ca.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CompanyCaList extends StatefulWidget {
  final Company company;

  CompanyCaList({
    Key key,
    @required this.company,
  }) : super(key: key);

  @override
  _CompanyCaListState createState() => _CompanyCaListState();
}

class _CompanyCaListState extends State<CompanyCaList> {
  //BSE
  BseCompanyCa bseFavCa;
  List<BseCa> bseFavList;
  Future<List<BseCa>> bseList;

  //NSE
  NseCompanyCa nseFavCa;
  List<NseCa> nseFavList;
  Future<List<NseCa>> nseList;

  //MC
  McCompanyCa mcFavCa;
  List<McCa> mcFavList;
  Future<List<McCa>> mcList;

  @override
  void initState() {
    if (widget.company.exchange == 'BSE') {
      //BSE
      bseFavCa = new BseCompanyCa();
      bseList = bseFavCa.getCompanyCa(widget.company.code);
      bseFavList = [];
    } else if (widget.company.exchange == 'NSE') {
      //NSE
      nseFavCa = new NseCompanyCa();
      nseList = nseFavCa.getCompanyCa(widget.company.code);
      nseFavList = [];
    } else {
      //MC
      mcFavCa = new McCompanyCa();
      mcList = mcFavCa.getCompanyCa(widget.company.name);
      mcFavList = [];
    }
    initializer();
    super.initState();
  }

  void initializer() async {
    if (widget.company.exchange == 'BSE') {
      bseFavList = await bseList;
    } else if (widget.company.exchange == 'NSE') {
      nseFavList = await nseList;
    } else {
      mcFavList = await mcList;
    }
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
      body: (widget.company.exchange == 'BSE')
          ? FutureBuilder(
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
                } else if (snapshot.data.length == 0) {
                  return Container(
                    child: Center(
                      child: Image.asset('images/no_data.png'),
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
                        onTap: () {
                          // dialogs.information(context, snapshot.data[index]);
                          Navigator.of(context).pushNamed('/bsedetailspage',
                              arguments: snapshot.data[index]);
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
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            )
          : (widget.company.exchange == 'NSE')
              ? FutureBuilder(
                  future: nseList,
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
                    } else if (snapshot.data.length == 0) {
                      return Container(
                        child: Center(
                          child: Image.asset('images/no_data.png'),
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
                          margin:
                              EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white,
                          ),
                          child: ListTile(
                            onTap: () {
                              // dialogs.information(context, snapshot.data[index]);
                              Navigator.of(context).pushNamed('/nsedetailspage',
                                  arguments: snapshot.data[index]);
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
                                  snapshot.data[index].symbol,
                                  style: Theme.of(context).textTheme.headline2,
                                ),
                                Text(
                                    "Company Name: ${snapshot.data[index].companyName}"),
                                Text("Ex-Date: ${snapshot.data[index].exDate}"),
                                Text(
                                    "Purpose: ${snapshot.data[index].purpose}"),
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
                )
              : FutureBuilder(
                  future: mcList,
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
                    } else if (snapshot.data.length == 0) {
                      return Container(
                        child: Center(
                          child: Image.asset('images/no_data.png'),
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
                          margin:
                              EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white,
                          ),
                          child: ListTile(
                            onTap: () {
                              // dialogs.information(context, snapshot.data[index]);
                              Navigator.of(context).pushNamed('/mcdetailspage',
                                  arguments: snapshot.data[index]);
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
                                  snapshot.data[index].companyName,
                                  style: Theme.of(context).textTheme.headline2,
                                ),
                                Text("Ex-Date: ${snapshot.data[index].exDate}"),
                                Text(
                                    "Purpose: ${snapshot.data[index].purpose}"),
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
