import 'package:anton_sih_app/models/bse_ca.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class DetailsBox extends StatelessWidget {
  final String name;
  final String value;
  DetailsBox(this.name, this.value);
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Container(
      height: 0.05 * screenHeight,
      width: 0.85 * screenWidth,
//      decoration: BoxDecoration(
//        border: Border(
//          bottom: BorderSide(color: Colors.black, width: 0.2),
//        ),
//        color: Color(0xffF3F5F7),
//      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            name,
            style: Theme.of(context).textTheme.subtitle1,
          ),
          Text(
            value,
            style: Theme.of(context).textTheme.bodyText2,
          ),
        ],
      ),
    );
  }
}
