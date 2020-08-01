import 'package:anton_sih_app/core/db_helper/external_db_helper.dart';
import 'package:anton_sih_app/core/utilities/debouncer.dart';
import 'package:anton_sih_app/models/companies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CompaniesPage extends StatefulWidget {
  @override
  _CompaniesPageState createState() => _CompaniesPageState();
}

class _CompaniesPageState extends State<CompaniesPage> {
  final _debouncer = Debouncer(milliseconds: 300);
  External_Database_Manager dbManager;
  String searchText;
  String exchangeType;
  Future<List<Company>> companyList;
  List<Company> companyFilterList;

  @override
  void initState() {
    // TODO: implement initState

    exchangeType = 'BSE';
    dbManager = new External_Database_Manager();
    companyList = dbManager.getCompanies();
    companyFilterList = [];

    initializer();

    super.initState();
  }

  void initializer() async {
    companyFilterList = await companyList;
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color(0xff24213F)),
        elevation: 0,
        backgroundColor: Color(0xffF3F5F7),
        title: Text(
          'Companies',
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
      backgroundColor: Color(0xffF3F5F7),
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 20, right: 20, bottom: 15, top: 20),
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
                List<Company> originalCompanyList = await companyList;
                searchText = value;
                _debouncer.run(() {
                  setState(() {
                    companyFilterList = originalCompanyList
                        .where((f) => (f.name
                                .toLowerCase()
                                .contains(value.toLowerCase()) ||
                            f.code.toLowerCase().contains(value.toLowerCase())))
                        .toList();
                  });
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

          //TODO: LIST VIEW BUILDER
          Expanded(
            child: FutureBuilder(
              future: companyList,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (companyFilterList.length == 0) {
                  return Container(
                    child: Center(
                      child: Image.asset('images/no_data.png'),
                    ),
                  );
                }
                return ListView.builder(
                  itemCount: companyFilterList.length,
                  itemBuilder: (context, index) {
                    final item = companyFilterList[index];
                    return Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 5),
                        child: ListTile(
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
                              SizedBox(
                                height: 0.01 * screenHeight,
                              ),
                              Text(
                                "Security Code: ${item.code}",
                              ),
                            ],
                          ),
                          trailing: IconButton(
                            icon: Icon(
                              (item.isFavorite == 0)
                                  ? Icons.favorite_border
                                  : Icons.favorite,
                              color: Colors.red,
                            ),
                            onPressed: () {
                              dbManager
                                  .changeFavoriteStatus(
                                      item.code, (item.isFavorite == 0) ? 1 : 0)
                                  .then((value) {
                                setState(() {
                                  this.companyFilterList[index].isFavorite =
                                      (item.isFavorite == 0) ? 1 : 0;
                                });
                              });
                            },
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
