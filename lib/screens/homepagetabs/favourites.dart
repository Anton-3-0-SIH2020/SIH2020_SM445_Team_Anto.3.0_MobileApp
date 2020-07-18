import 'package:flutter/material.dart';
import 'package:anton_sih_app/core/api/latest_corporate_action.dart';
import 'package:anton_sih_app/models/bse_ca.dart';
import 'package:anton_sih_app/models/mc_ca.dart';
import 'package:anton_sih_app/models/nse_ca.dart';
import 'package:unicorndial/unicorndial.dart';
import 'package:anton_sih_app/core/utilities/debouncer.dart';
import '../../models/favouritecompanies.dart';

class FavouritesTab extends StatefulWidget {
  @override
  _FavouritesPageState createState() => _FavouritesPageState();
}

class _FavouritesPageState extends State<FavouritesTab> {
  List<FavouriteCompanies> favCompanies = [
    FavouriteCompanies('NAME1', '500825', true),
    FavouriteCompanies('NAME2', '1234', true),
    FavouriteCompanies('NAME3', '1234', true),
    FavouriteCompanies('NAME4', '1234', true),
    FavouriteCompanies('NAME5', '1234', true),
    FavouriteCompanies('NAME6', '1234', true),
  ];

  final _debouncer = Debouncer(milliseconds: 200);
  BseLatestCa bseLatestCa;
  NseLatestCa nseLatestCa;
  McLatestCa mcLatestCa;

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

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Color(0xffF3F5F7),
        body: Column(
          children: <Widget>[
            Row(
              children: [
                Expanded(
                  flex: 1,
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
                  flex: 3,
                  child: Container(
                    margin: EdgeInsets.only(
                        left: 15, right: 20, bottom: 15, top: 20),
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
              ],
            ),

            //TODO: LIST VIEW BUILDER
            Expanded(
              child: ListView.builder(
                // Let the ListView know how many items it needs to build.
                itemCount: favCompanies.length,
                // Provide a builder function. This is where the magic happens.
                // Convert each item into a widget based on the type of item it is.
                itemBuilder: (context, index) {
                  final item = favCompanies[index];

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
                        Navigator.of(context).pushNamed('/companycalist',
                            arguments: item.securityCode);
                      },
                      leading: Container(
                        height: 0.05 * screenHeight,
                        width: 0.1 * screenWidth,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('images/coins.png'),
                              fit: BoxFit.cover),
                        ),
                      ),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            item.name,
                            style: Theme.of(context).textTheme.headline2,
                          ),
                          Text("Security Code: ${item.securityCode}"),
                          // Text("Ex-Date: ${bseFilterList[index].exDate}"),
                          // Text("Purpose: ${bseFilterList[index].purpose}"),
                          // SizedBox(
                          //   height: 2,
                          // ),
                        ],
                      ),
                      trailing: IconButton(
                        icon: Icon(
                          Icons.star,
                          color: Color(0xFFF4C2C2),
                        ),
                        onPressed: null,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ));
  }
}
