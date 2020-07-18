import 'package:anton_sih_app/core/api/download_file.dart';
import 'package:anton_sih_app/core/api/endpoints.dart';
import 'package:anton_sih_app/core/api/latest_corporate_action.dart';
import 'package:anton_sih_app/core/utilities/debouncer.dart';
import 'package:anton_sih_app/models/bse_ca.dart';
import 'package:anton_sih_app/models/mc_ca.dart';
import 'package:anton_sih_app/models/nse_ca.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:unicorndial/unicorndial.dart';

class HomeTab extends StatefulWidget {
  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  final _debouncer = Debouncer(milliseconds: 200);

  //API CALLS
  BseLatestCa bseLatestCa;
  NseLatestCa nseLatestCa;
  McLatestCa mcLatestCa;
  DownloadFiles downloadFilesCall;

  //BSE LISTS
  List<BseCa> bseFilterList;
  Future<List<BseCa>> bseList;

  //NSE LISTS
  List<NseCa> nseFilterList;
  Future<List<NseCa>> nseList;

  //MC LISTS
  List<McCa> mcFilterList;
  Future<List<McCa>> mcList;

  String searchText;
  String exchangeType;

  @override
  void initState() {
    // TODO: implement initState
    exchangeType = 'BSE';

    downloadFilesCall = new DownloadFiles();

    //BSE
    bseLatestCa = new BseLatestCa();
    bseList = bseLatestCa.getLatestCa();
    bseFilterList = [];

    //NSE
    nseLatestCa = new NseLatestCa();
    nseList = nseLatestCa.getLatestCa();
    nseFilterList = [];

    //MC
    mcLatestCa = new McLatestCa();
    mcList = mcLatestCa.getLatestCa();
    mcFilterList = [];

    initializer();
    super.initState();
  }

  void initializer() async {
    bseFilterList = await bseList;
    nseFilterList = await nseList;
    mcFilterList = await mcList;
  }

//  Future<void> downloadFile() async {
//    var status = await Permission.storage.status;
//    if (status.isUndetermined) {
//      print('----Asking For Storage Permissions----');
//    }
//    if (await Permission.location.isRestricted) {
//      print('----Access Restricted----');
//    }
//
//    if (await Permission.storage.request().isGranted) {
//      print('Downloading...');
//      Dio dio = Dio();
//      String fileUrl = Endpoints.baseUrl + Endpoints.downloadBsePdf;
//      try {
//        var dir = await getApplicationDocumentsDirectory();
//        await dio.download(fileUrl, "${'/sdcard/downloads'}/bse_pdf.pdf",
//            onReceiveProgress: (rec, total) {
//          print("Rec: $rec , Total: $total");
//          print(dir.path);
//        });
//      } catch (e) {
//        print(e);
//      }
//    }
//    print("Download completed");
//  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xffF3F5F7),
      floatingActionButton: UnicornDialer(
          backgroundColor: Color.fromRGBO(255, 255, 255, 0.5),
          parentButtonBackground: Color(0xff3F72F9),
          orientation: UnicornOrientation.VERTICAL,
          parentButton: Icon(Icons.cloud_download),
          childButtons: [
            UnicornButton(
              hasLabel: true,
              labelText: "BSE PDF",
              currentButton: FloatingActionButton(
                heroTag: "BSE PDF",
                backgroundColor: Color(0xff3F72F9),
                mini: true,
                child: Icon(Icons.picture_as_pdf),
                onPressed: () {
                  downloadFilesCall.downloadFile(
                      Endpoints.baseUrl + Endpoints.downloadBsePdf,
                      'bse_pdf.pdf');
                },
              ),
            ),
            UnicornButton(
              hasLabel: true,
              labelText: "BSE CSV",
              currentButton: FloatingActionButton(
                heroTag: "BSE CSV",
                backgroundColor: Color(0xff3F72F9),
                mini: true,
                child: Icon(Icons.insert_drive_file),
                onPressed: () {
                  downloadFilesCall.downloadFile(
                      Endpoints.baseUrl + Endpoints.downloadBseCsv,
                      'bse_csv.csv');
                },
              ),
            ),
            UnicornButton(
              hasLabel: true,
              labelText: "NSE PDF",
              currentButton: FloatingActionButton(
                heroTag: "NSE PDF",
                backgroundColor: Color(0xff3F72F9),
                mini: true,
                child: Icon(Icons.picture_as_pdf),
                onPressed: () {
                  downloadFilesCall.downloadFile(
                      Endpoints.baseUrl + Endpoints.downloadNsePdf,
                      'nse_pdf.pdf');
                },
              ),
            ),
            UnicornButton(
              hasLabel: true,
              labelText: "NSE CSV",
              currentButton: FloatingActionButton(
                heroTag: "NSE CSV",
                backgroundColor: Color(0xff3F72F9),
                mini: true,
                child: Icon(Icons.insert_drive_file),
                onPressed: () {
                  downloadFilesCall.downloadFile(
                      Endpoints.baseUrl + Endpoints.downloadNseCsv,
                      'nse_csv.csv');
                },
              ),
            ),
            UnicornButton(
              hasLabel: true,
              labelText: "MC PDF",
              currentButton: FloatingActionButton(
                heroTag: "MC PDF",
                backgroundColor: Color(0xff3F72F9),
                mini: true,
                child: Icon(Icons.picture_as_pdf),
                onPressed: () {
                  downloadFilesCall.downloadFile(
                      Endpoints.baseUrl + Endpoints.downloadMcPdf,
                      'mc_pdf.pdf');
                },
              ),
            ),
            UnicornButton(
              hasLabel: true,
              labelText: "MC CSV",
              currentButton: FloatingActionButton(
                heroTag: "MC CSV",
                backgroundColor: Color(0xff3F72F9),
                mini: true,
                child: Icon(Icons.insert_drive_file),
                onPressed: () {
                  downloadFilesCall.downloadFile(
                      Endpoints.baseUrl + Endpoints.downloadMcCsv,
                      'mc_csv.csv');
                },
              ),
            ),
          ]),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 4,
                child: Container(
                  margin: EdgeInsets.only(left: 20, bottom: 15, top: 20),
                  padding: EdgeInsets.only(
                    left: 18,
                    right: 8,
                    top: 8,
                    bottom: 8,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.5),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(168, 192, 255, 0.16),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: DropdownButton<String>(
                    value: exchangeType,
                    elevation: 16,
                    underline: Container(height: 0),
                    style: TextStyle(color: Colors.black45),
                    icon: Icon(Icons.keyboard_arrow_down),
                    onChanged: (String newValue) {
                      setState(() {
                        exchangeType = newValue;
                      });
                    },
                    items: <String>['BSE', 'NSE', 'MC']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
              Expanded(
                flex: 8,
                child: Container(
                  margin:
                      EdgeInsets.only(left: 15, right: 5, bottom: 15, top: 20),
                  padding: EdgeInsets.only(
                    left: 21.5,
                    right: 8,
                    top: 8,
                    bottom: 8,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.5),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(168, 192, 255, 0.16),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  //Search Bar
                  child: TextFormField(
                    onChanged: (value) async {
                      //Filtering Content Logic
                      List<BseCa> bseOriginalList = await bseList;
                      List<NseCa> nseOriginalList = await nseList;
                      List<McCa> mcOriginalList = await mcList;

                      searchText = value;
                      _debouncer.run(() {
                        if (exchangeType == 'BSE') {
                          setState(() {
                            bseFilterList = bseOriginalList
                                .where((f) => (f.securityName
                                        .toLowerCase()
                                        .contains(value.toLowerCase()) ||
                                    f.purpose
                                        .toLowerCase()
                                        .contains(value.toLowerCase())))
                                .toList();
                          });
                        } else if (exchangeType == 'NSE') {
                          setState(() {
                            nseFilterList = nseOriginalList
                                .where((f) => (f.symbol
                                        .toLowerCase()
                                        .contains(value.toLowerCase()) ||
                                    f.purpose
                                        .toLowerCase()
                                        .contains(value.toLowerCase())))
                                .toList();
                          });
                        } else {
                          setState(() {
                            mcFilterList = mcOriginalList
                                .where((f) => (f.companyName
                                        .toLowerCase()
                                        .contains(value.toLowerCase()) ||
                                    f.purpose
                                        .toLowerCase()
                                        .contains(value.toLowerCase())))
                                .toList();
                          });
                        }
                      });
                      print(searchText);
                    },
                    cursorColor: Color(0xff24213f),
                    style: TextStyle(
                      color: Color(0xff24213f),
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      //"SEARCH"
                      hintText: 'Search', //'Search for a topic',
                      suffixIcon: Icon(
                        Icons.search,
                        color: Colors.black38,
                      ),
                      hintStyle: TextStyle(
                        color: Color(0xFF8d8d8d),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  margin: EdgeInsets.only(right: 10),
                  child: IconButton(
                    icon: Icon(Icons.filter_list),
                    onPressed: () {},
                  ),
                ),
              )
            ],
          ),
          (exchangeType == 'BSE')
              ? Expanded(
                  child: FutureBuilder(
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
                        itemCount: bseFilterList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            margin: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.white,
                            ),
                            child: ListTile(
                              onTap: () {
                                // dialogs.information(context, snapshot.data[index]);
                                Navigator.of(context).pushNamed(
                                    '/bsedetailspage',
                                    arguments: bseFilterList[index]);
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
                                    bseFilterList[index].securityName,
                                    style:
                                        Theme.of(context).textTheme.headline2,
                                  ),
                                  Text(
                                      "Security Code: ${bseFilterList[index].securityCode}"),
                                  Text(
                                      "Ex-Date: ${bseFilterList[index].exDate}"),
                                  Text(
                                      "Purpose: ${bseFilterList[index].purpose}"),
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
                )
              : (exchangeType == 'NSE')
                  ? Expanded(
                      child: FutureBuilder(
                        future: nseList,
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
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
                            itemCount: nseFilterList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                margin: EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.white,
                                ),
                                child: ListTile(
                                  onTap: () {
                                    // dialogs.information(context, snapshot.data[index]);
                                    Navigator.of(context).pushNamed(
                                        '/nsedetailspage',
                                        arguments: nseFilterList[index]);
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        nseFilterList[index].symbol,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline2,
                                      ),
                                      Text(
                                          "Company Name: ${nseFilterList[index].companyName}"),
                                      Text(
                                          "Ex-Date: ${nseFilterList[index].exDate}"),
                                      Text(
                                          "Purpose: ${nseFilterList[index].purpose}"),
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
                    )
                  : Expanded(
                      child: FutureBuilder(
                        future: mcList,
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
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
                            itemCount: mcFilterList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                margin: EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.white,
                                ),
                                child: ListTile(
                                  onTap: () {
                                    // dialogs.information(context, snapshot.data[index]);
                                    Navigator.of(context).pushNamed(
                                        '/mcdetailspage',
                                        arguments: mcFilterList[index]);
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        mcFilterList[index].companyName,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline2,
                                      ),
                                      Text(
                                          "Ex-Date: ${mcFilterList[index].exDate}"),
                                      Text(
                                          "Purpose: ${mcFilterList[index].purpose}"),
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
                    )
        ],
      ),
    );
  }
}
