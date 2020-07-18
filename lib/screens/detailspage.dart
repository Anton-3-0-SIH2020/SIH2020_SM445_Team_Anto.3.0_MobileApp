import 'package:anton_sih_app/widgets/detailsdialog.dart';
import 'package:flutter/material.dart';
import 'package:anton_sih_app/models/bse_ca.dart';

class DetailsPage extends StatefulWidget {
  final BseCa data;

  DetailsPage({
    Key key,
    @required this.data,
  }) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  bool _isFavorited = false;
  @override
  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        _isFavorited = false;
      } else {
        _isFavorited = true;
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    print(widget.data.exDate);
    super.initState();
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
          'Corporate Action',
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
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 25, 0, 0),
            child: Center(
              child: Container(
                height: 0.2 * screenHeight,
                width: 0.85 * screenWidth,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(168, 192, 255, 0.8),
                      spreadRadius: 5,
                      blurRadius: 10,
                      offset: Offset(0, 2), // changes position of shadow
                    ),
                  ],
                  borderRadius: BorderRadius.circular(30),
                  color: Color(0xff3F72F9),
                ),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: IconButton(
                          icon: (_isFavorited
                              ? Icon(
                                  Icons.star,
                                  size: 30,
                                )
                              : Icon(
                                  Icons.star_border,
                                  size: 30,
                                )),
                          color: Color(0xFFF4C2C2),
                          onPressed: _toggleFavorite,
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        widget.data.securityName,
                        style: Theme.of(context).textTheme.caption,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(
                    height: 0.05 * screenHeight,
                  ),
                  DetailsBox("Security Code", widget.data.securityCode),
                  SizedBox(
                    height: 0.020 * screenHeight,
                  ),
                  DetailsBox("Ex-Date", widget.data.exDate),
                  SizedBox(
                    height: 0.020 * screenHeight,
                  ),
                  DetailsBox("Record Date", widget.data.recordDate),
                  SizedBox(
                    height: 0.020 * screenHeight,
                  ),
                  DetailsBox("Purpose", widget.data.purpose),
                  SizedBox(
                    height: 0.020 * screenHeight,
                  ),
                  DetailsBox("BC Start Date", widget.data.bcStartDate),
                  SizedBox(
                    height: 0.020 * screenHeight,
                  ),
                  DetailsBox("BC End Date", widget.data.bcEndDate),
                  SizedBox(
                    height: 0.020 * screenHeight,
                  ),
                  DetailsBox("ND Start Date", widget.data.ndStartDate),
                  SizedBox(
                    height: 0.020 * screenHeight,
                  ),
                  DetailsBox("ND End Date", widget.data.ndEndDate),
                  SizedBox(
                    height: 0.020 * screenHeight,
                  ),
                  DetailsBox("ND Start Date", widget.data.ndStartDate),
                  SizedBox(
                    height: 0.020 * screenHeight,
                  ),
                  DetailsBox("ND End Date", widget.data.ndEndDate),
                  SizedBox(
                    height: 0.020 * screenHeight,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
